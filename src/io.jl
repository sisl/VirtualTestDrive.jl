type SCPHeader
    sender::Vector{Uint8} # 64-byte sender string
    receiver::Vector{Uint8} # 64-byte receiver string
    len::Int32

    function SCPHeader(senderstr::String, receiverstr::String, len::Int32)
        sender_short = string_to_zeroed_null_terminated_array(senderstr, VIRES_HEADER_STRING_LEN)
        receiver_short = string_to_zeroed_null_terminated_array(receiverstr, VIRES_HEADER_STRING_LEN)
        SCPHeader(sender_short,receiver_short,len)
    end

    function SCPHeader(sender_in::Vector{Uint8},receiver_in::Vector{Uint8},len::Int32)
        sender = zeros(Uint8, VIRES_HEADER_STRING_LEN)
        receiver = zeros(Uint8, VIRES_HEADER_STRING_LEN)
        copy!(sender, 1, sender_in, 1, min(length(sender_in), VIRES_HEADER_STRING_LEN))
        copy!(receiver, 1, receiver_in, 1, min(length(receiver_in), VIRES_HEADER_STRING_LEN))
        sender[end] = uint8(0) # ensure null-terminate
        receiver[end] = uint8(0)
        
        new(sender, receiver, len)
    end
end
type SCPMessage
    header::SCPHeader
    payload::Vector{Uint8} # <- xml string

    function SCPMessage(sender::String, receiver::String, payloadstr::String)
        payload = string_to_zeroed_null_terminated_array(payloadstr)
        header = SCPHeader(sender, receiver, int32(length(payload)))
        new(header, payload)
    end
    SCPMessage(payloadstr::String) = SCPMessage("SCP", "TaskControl", payloadstr)

    function SCPMessage(sender::Vector{Uint8},receiver::Vector{Uint8}, payload::Vector{Uint8})
        if payload[end] != NULL
            push!(payload, NULL)
        end
        header = SCPHeader(sender, receiver, int32(length(payload)))
        new(header, payload)
    end
end

function string_to_zeroed_null_terminated_array(str::String)
    strlen = length(str)
    array = zeros(Uint8, strlen+1)
    array[1:strlen] = convert(Vector{Uint8}, str)
    array[end] = NULL
    array
end
function string_to_zeroed_null_terminated_array(str::String, array_length::Int)
    array = zeros(Uint8, array_length)
    len = min(array_length-1, length(str))
    array[1:len] = convert(Vector{Uint8}, str)[1:len]
    array
end
function string_from_buffer(arr::Vector{Uint8})
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
    println(STDOUT, "SENDING")
    print_message(message)
end

function Base.read(io::IO, ::Type{SCPMessage}, already_has_magic_number::Bool=false)
    if !already_has_magic_number
        @assert(scan_for_next_message(io)) # TODO(tim): handle this correctly
    end

    version_number = read(io, Uint16)
    sender = readbytes(io, 64)
    receiver = readbytes(io, 64)
    payloadsize = read(io, Int32)
    payload = readbytes(io, payloadsize)   
    message = SCPMessage(sender,receiver,payload)
    println(STDOUT, "READING")
    print_message(message)
    message
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
    dat = Array(Uint8, VIRES_HEADER_LEN + message.header.len + 1)
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

function scan_for_next_message(io::IO, timeout::Float64=TIMEOUT_DEFAULT)
    start_time = time()
    finished = false
    while !finished && time() - start_time < timeout
        finished = read(io, Uint16) == VIRES_MAGIC_NUMBER
    end
    finished
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