type SCPHeader
    sender::Vector{UInt8} # 64-byte sender string
    receiver::Vector{UInt8} # 64-byte receiver string
    len::Int32

    function SCPHeader(senderstr::String, receiverstr::String, len::Int32)
        sender_short = string_to_zeroed_null_terminated_array(senderstr, VIRES_HEADER_STRING_LEN)
        receiver_short = string_to_zeroed_null_terminated_array(receiverstr, VIRES_HEADER_STRING_LEN)
        SCPHeader(sender_short,receiver_short,len)
    end

    function SCPHeader(sender_in::Vector{UInt8},receiver_in::Vector{UInt8},len::Int32)
        sender = zeros(UInt8, VIRES_HEADER_STRING_LEN)
        receiver = zeros(UInt8, VIRES_HEADER_STRING_LEN)
        copy!(sender, 1, sender_in, 1, min(length(sender_in), VIRES_HEADER_STRING_LEN))
        copy!(receiver, 1, receiver_in, 1, min(length(receiver_in), VIRES_HEADER_STRING_LEN))
        sender[end] = UInt8(0) # ensure null-terminate
        receiver[end] = UInt8(0)
        
        new(sender, receiver, len)
    end
end
type SCPMessage
    header::SCPHeader
    payload::Vector{UInt8} # <- xml string

    function SCPMessage(sender::String, receiver::String, payloadstr::String)
        payload = string_to_zeroed_null_terminated_array(payloadstr)
        header = SCPHeader(sender, receiver, Int32(length(payload)))
        new(header, payload)
    end
    SCPMessage(payloadstr::String) = SCPMessage("SCP", "TaskControl", payloadstr)

    function SCPMessage(sender::Vector{UInt8},receiver::Vector{UInt8}, payload::Vector{UInt8})
        if payload[end] != NULL
            push!(payload, NULL)
        end
        header = SCPHeader(sender, receiver, Int32(length(payload)))
        new(header, payload)
    end
end

function string_to_zeroed_null_terminated_array(str::String)
    strlen = length(str)
    arr = zeros(UInt8, strlen+1)
    arr[1:strlen] = convert(Vector{UInt8}, str)
    arr[end] = NULL
    arr
end
function string_to_zeroed_null_terminated_array(str::String, array_length::Int)
    arr = zeros(UInt8, array_length)
    len = min(array_length-1, length(str))
    arr[1:len] = convert(Vector{UInt8}, str)[1:len]
    arr
end
function string_from_buffer(arr::Vector{UInt8})
    nulindex = findfirst(arr, NULL)
    if nulindex == 0
        nulindex = length(arr)
    end
    bytestring(arr[1:nulindex-1])
end

function Base.write(io::IO, header::SCPHeader)
    write(io, VIRES_MAGIC_NUMBER)
    write(io, VIRES_VERSION_HEADER)
    write(io, header.sender)
    write(io, header.receiver)
    write(io, header.len)
end
function Base.write(io::IO, message::SCPMessage)
    write(io, message.header)
    write(io, message.payload)
    print_with_color(:blue, STDOUT, "SENDING\n")
    print_message(message)
end

function Base.read(io::IO, ::Type{SCPMessage}, already_has_magic_number::Bool=false)
    if !already_has_magic_number
        scan_for_value(io, VIRES_MAGIC_NUMBER)
    end

    version_number = read(io, UInt16)
    sender = readbytes(io, 64)
    receiver = readbytes(io, 64)
    payloadsize = read(io, Int32)
    payload = readbytes(io, payloadsize)   
    message = SCPMessage(sender,receiver,payload)
    println(STDOUT, "READING")
    print_message(message)
    message
end
function write_bytehex_to_stdout(f::Function)
    # ex: write_bytehex_to_stdout((buf)->write(buf, 0x08))

    # io -> f(io)
    buf = IOBuffer()
    f(buf)
    println(STDOUT, bytes2hex(takebuf_array(buf)))
end
function print_message(message::SCPMessage)
    # println(STDOUT, "\tSENDER:       ", bytes2hex(message.header.sender))
    # println(STDOUT, "\tSENDER:       ", string_from_buffer(message.header.sender))
    # println(STDOUT, "\tRECEIVER:     ", bytes2hex(message.header.receiver))
    # println(STDOUT, "\tRECEIVER:     ", string_from_buffer(message.header.receiver))
    # println(STDOUT, "\tPAYLOAD SIZE: ", message.header.len)
    println(STDOUT, string_from_buffer(message.header.sender), " -> ", string_from_buffer(message.header.receiver), ": ")
    println(STDOUT, "\tPAYLOAD:      ", string_from_buffer(message.payload))
    # println(STDOUT, "\t              ", bytes2hex(message.payload))
end
function print_message_bytes(message::SCPMessage)
    dat = Array(UInt8, VIRES_HEADER_LEN + message.header.len + 1)
    buf = IOBuffer(dat, true, true)
    write(buf, message)
    println(STDOUT, "STRING BUFFER: ")
    println(STDOUT, bytes2hex(dat))
end
function idle_and_print_messages(io::IO, sleeptime::Float64)
    start_time = time()
    while time() - start_time < sleeptime
        message = read(io, SCPMessage)
        print_with_color(:red, "RECEIVED\n")
        print_message(message)
    end
end

function scan_for_value(io::IO, target::UInt8)
    #=
    Blocks the stream until you get the byte you want
    =#

    while read(io, UInt8) != target
        # do nothing
    end
    nothing
end
function scan_for_value(io::IO, value::UInt16)

    #=
    Blocks the stream until you get the bytes you want
    Note: value[1] must be found first, then value[2], etc.
    =#

    byte_index = 1
    lo = UInt8(value & 0x00FF)
    hi = UInt8((value & 0xFF00) >> 8)

    while byte_index ≤ 2
        val = read(io, UInt8)
        if byte_index == 1
            byte_index += Int(val == lo)
        else
            byte_index = (val == hi) ? 3 : 1
        end
    end
    nothing
end

function wait_for_packet_with_element(io::IO, name::String, elementname::String; timeout::Float64=TIMEOUT_DEFAULT)

    finished = false  
    start_time = time()
    while !finished && time() - start_time < timeout
        received = read(io, SCPMessage)
        finished = message_contains_packet_with_element(received, name, elementname)
    end

    finished # if finished is true, we did not time out
end
function wait_for_mirrored_messsage(io::IO, message::SCPMessage; timeout::Float64=TIMEOUT_DEFAULT)

    sent::ETree = message_payload_to_etree(message)

    finished = false  
    start_time = time()
    while !finished && time() - start_time < timeout
        received = read(io, SCPMessage)
        finished = (string_from_buffer(received.header.sender) == string_from_buffer(received.header.receiver) == CLIENT_NAME) &&
                sent == message_payload_to_etree(received)
    end

    finished # if finished = true, we did not time out
end
function write_and_wait_for_mirrored_message(io::IO, message::SCPMessage; timeout::Float64=TIMEOUT_DEFAULT)
    write(io, message)
    wait_for_mirrored_messsage(io, message, timeout=timeout)
end
function write_and_wait_for_mirrored_message(io::IO, message::SCPMessage, error_message::String; timeout::Float64=TIMEOUT_DEFAULT)
    write(io, message)
    if !wait_for_mirrored_messsage(io, message, timeout=timeout)
        error(error_message)
    end
    true
end