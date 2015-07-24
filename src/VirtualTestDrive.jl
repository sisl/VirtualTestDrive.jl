module VirtualTestDrive
    
using LibExpat

import Base: TcpSocket, ==

export
    ViresConnection, 
    SCPMessage,
    DriverDefinition,

    BRISK_DRIVER,
    COMFORTABLE_DRIVER,
    DEFAULT_DRIVER,
    HASTY_DRIVER,
    INSECURE_DRIVER,

    find_vtd_directory,
    start_vires_vtd_tasks,
    stop_vires_components,

    load_scenario,
    record_scenario_run,
    set_driver_behavior,
    init,
    convert_recording_to_csv,
    
    idle_and_print_messages

const TCP_PORT = 48179
const CLIENT_NAME = "SCP"

const VIRES_MAGIC_NUMBER = uint16(40108)
const VIRES_VERSION_HEADER = uint16(1)
const VIRES_HEADER_STRING_LEN = 64
const VIRES_HEADER_LEN = 2*2 + 2*VIRES_HEADER_STRING_LEN + 4

const RDB_MAGIC_NUMBER = uint16(35712)
const RDB_VERSION = uint16(0x0118)
const RDB_PKG_ID_START_OF_FRAME = uint16(1)
const RDB_PKG_ID_END_OF_FRAME = uint16(2)

const NULL = zero(Uint8)

const TIMEOUT_DEFAULT = 2.0 # [s]
const TIMEOUT_LONG_DEFAULT = 20.0 # [s]

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

type Scene
    layout_file::String
    visual_database::String
end

type DriverDefinition
    desired_velocity::Float64
    desired_acceleraion::Float64
    desired_deceleration::Float64
    curve_speed::Float64
    observe_speed_limits::Float64
    distance_keeping::Float64
    lane_keeping::Float64
    speed_keeping::Float64
    lane_change_dynamic::Float64
    urge_to_overtake::Float64
    keep_right_rule::Float64
    respond_to_tailgate::Float64
    foresight_distance::Float64
    steering_distance::Float64
    use_of_indicator::Float64
    obey_traffic_signs::Bool
    obey_traffic_lights::Bool
end

function Base.copy(d::DriverDefinition)
    DriverDefinition(d.desired_velocity, d.desired_acceleraion, d.desired_deceleration, d.curve_speed,
        d.observe_speed_limits, d.distance_keeping, d.lane_keeping,d.speed_keeping,d.lane_change_dynamic,
        d.urge_to_overtake, d.keep_right_rule, d.respond_to_tailgate, d.foresight_distance, d. steering_distance,
        d. use_of_indicator, d.obey_traffic_signs, d.obey_traffic_lights)
end


const BRISK_DRIVER = DriverDefinition(0.7,0.65,0.65,0.6,0.45,0.4,00.5,0.5,0.6,0.6,0.5,0.5,0.55,0.5,0.65,true,true)
const COMFORTABLE_DRIVER = DriverDefinition(0.45,0.4,0.4,0.4,0.6,0.55,0.5,0.5,0.45,0.4,0.5,0.5,0.6,0.4,0.75,true,true)
const DEFAULT_DRIVER = DriverDefinition(0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,true,true)
const HASTY_DRIVER = DriverDefinition(0.85,0.8,0.8,0.8,0.35,0.35,0.7,0.7,0.75,0.85,0.5,0.5,0.5,0.7,0.3,true,true)
const INSECURE_DRIVER = DriverDefinition(0.4,0.35,0.65,0.35,0.9,0.65,0.3,0.3,0.35,0.2,0.5,0.5,0.3,0.3,0.20,true,true)

type ViresConnection
    socket::TcpSocket
    ViresConnection() = ViresConnection(TCP_PORT)
    ViresConnection(socket::TcpSocket) = new(socket)
    function ViresConnection(port::Integer;
        sleeptime::Float64=0.1, # [sec]
        timeout::Float64=TIMEOUT_LONG_DEFAULT # [sec]
        )

        start_vires_vtd_tasks()
        socket = connect(TCP_PORT)

        # idle until connection is available
        start_time = time()
        while !isopen(socket) && time() - start_time < timeout
            sleep(sleeptime)
        end
        
        @assert(isopen(socket))
        retval = new(socket)
        finalizer(retval, obj->begin
            close(obj.socket)
            stop_vires_components()
        end)
        retval
    end
end

function find_vtd_directory()
    @linux ? (
            begin
                hd = homedir()
                for content in readdir(hd)
                    path = joinpath(hd, content)
                    if ismatch(r"VTD\.\d+\.\d+", content) && isdir(path)
                        dir = joinpath(path, "Data", "Setups", "Current", "Bin")
                        return dir
                    end
                end
                error("VTD directory not found")  
            end
            : error("non-linux os's not supported!")
            )
end
function start_vires_vtd_tasks()
    dir = find_vtd_directory()
    cd(dir) do
        run(`./startTasks`)
    end
end
function stop_vires_components()
    dir = find_vtd_directory()
    cd(dir) do
        run(`./stopTasks`)
    end
end

message_payload_to_etree(message::SCPMessage) = message_payload_to_etree(string_from_buffer(message.payload))
function message_payload_to_etree(payload::String)
    str = "<MSG>" * payload * "</MSG>"
    root = xp_parse(str)
    index_of_first_etree = findfirst(e->isa(e, ETree), root.elements)
    @assert(index_of_first_etree != 0)
    root.elements[index_of_first_etree]::ETree
end

function message_contains_packet_with_element(message::SCPMessage, name::String, elementname::String)
    str = "<MSG>" * string_from_buffer(message.payload) * "</MSG>"
    for e in xp_parse(str).elements
        if isa(e, ETree)
            if e.name == name
                payload = e.elements[findfirst(elem->isa(elem, ETree), e.elements)]
                if payload.name == elementname
                    return true
                end
            end
        end
    end
    false
end

function ==(sent::ETree, received::ETree)
    
    if sent.name == received.name &&
       sent.attr == received.attr
        if isempty(sent.elements)
            return true 
        end
        for elem_sent in sent.elements
            if isa(elem_sent, ETree)
                # there must be one of these in received
                elem_rec_index = 0

                for (i,e) in enumerate(received.elements)
                    if isa(e, ETree) && e.name == elem_sent.name
                        elem_rec_index = i
                        break
                    end
                end

                if elem_rec_index != 0 &&
                   elem_sent == received.elements[elem_rec_index]

                   return true
               end
            end

        end
    end

    false
end

function wait_for_packet_with_element(io::IO, name::String, elementname::String; timeout::Float64=TIMEOUT_DEFAULT)

    done = false  
    start_time = time()
    while !done && time() - start_time < timeout
        received = read(io, SCPMessage)
        done = message_contains_packet_with_element(received, name, elementname)
    end

    done # if done = true, we did not time out
end
function wait_for_mirrored_messsage(io::IO, message::SCPMessage; timeout::Float64=TIMEOUT_DEFAULT)

    sent::ETree = message_payload_to_etree(message)

    done = false  
    start_time = time()
    while !done && time() - start_time < timeout
        received = read(io, SCPMessage)
        done = (string_from_buffer(received.header.sender) == string_from_buffer(received.header.receiver) == CLIENT_NAME) &&
                sent == message_payload_to_etree(received)
    end

    done # if done = true, we did not time out
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

function load_scenario(vires::ViresConnection, scenario::String, mode::Symbol; timeout::Float64=TIMEOUT_DEFAULT, timeout_init::Float64=TIMEOUT_LONG_DEFAULT)

    write_and_wait_for_mirrored_message(vires.socket, 
                                        SCPMessage(get_xml_simctrl_loadscenario(scenario)),
                                        "load scenario timed out",
                                        timeout=timeout)

    init(vires, mode, timeout=timeout_init)
end
function init(vires::ViresConnection, mode::Symbol; timeout::Float64=TIMEOUT_LONG_DEFAULT)
    # NOTE(tim): this is wrong: we need to wait for InitDone message
    @assert(in(mode, (:operation, :preparation)))
    write(vires.socket, SCPMessage(get_xml_simctrl_init(mode)))
    if !wait_for_packet_with_element(vires.socket, "SimCtrl", "InitDone", timeout=timeout)
        error("init timed out")
    end
end
function record_scenario_run(
    vires::ViresConnection,
    nsteps::Int,
    destpath::String,
    timeout::Float64=TIMEOUT_DEFAULT)

    dir, file = splitdir(destpath)
    file_base = splitext(file)[1]
    file_dat = file_base * ".dat"

    # write_and_wait_for_mirrored_message(vires.socket,
    #                                     SCPMessage(get_xml_set_path(1, 1, 0.0)),
    #                                         "action speedchange failed",
    #                                         timeout=timeout)

    write_and_wait_for_mirrored_message(vires.socket, 
                                        SCPMessage(get_xml_record_overwrite(dir, file_dat)),
                                        "init timed out",
                                        timeout=timeout)

    # NOTE(tim): this is the one that worked, set(speed) did not for some reason
    # write_and_wait_for_mirrored_message(vires.socket, 
    #                                     SCPMessage(get_xml_egoctrl_speed(egospeed)),
    #                                     "did not set speed",
    #                                     timeout=timeout)

    write_and_wait_for_mirrored_message(vires.socket, 
                                        SCPMessage("<Player><DriverBehaviorNormalized distanceKeeping=\"0.05\"/></Player>"),
                                        "did not set speed",
                                        timeout=timeout)
    
    # write_and_wait_for_mirrored_message(vires.socket, 
    #                                     SCPMessage(get_xml_set_pos_inertial(1, 1860.67+10.0, 713.983+10.0, 4.99979+2.0, 2.00554037, 0, 0)),
    #                                     "did not set pos inertial",
    #                                     timeout=timeout)
    
    # write_and_wait_for_mirrored_message(vires.socket, 
    #                                     SCPMessage(get_xml_set_speed(1, egospeed)),
    #                                     "did not set speed",
    #                                     timeout=timeout)
    # write_and_wait_for_mirrored_message(vires.socket,
    #                                     SCPMessage("SCP" , "TaskControl",
    #                                     get_xml_player_driver_input(id=1, throttle=0.9)),
    #                                     "driver input timed out",
    #                                     timeout=timeout)
    # write_and_wait_for_mirrored_message(vires.socket,
    #                                     SCPMessage(get_xml_traffic_action_autonomous("Ego")),
    #                                         "action autonomous failed",
    #                                         timeout=timeout)
    # write_and_wait_for_mirrored_message(vires.socket,
    #                                     SCPMessage(get_xml_traffic_action_speedchange("Ego", 29.06, 1.0, delayTime=0.0)),
    #                                         "action speedchange failed",
    #                                         timeout=timeout)
    write_and_wait_for_mirrored_message(vires.socket, 
                                        SCPMessage(get_xml_simctrl_step(1)),
                                        "did not step",
                                        timeout=timeout)

    # write_and_wait_for_mirrored_message(vires.socket, 
    #                                     SCPMessage(get_xml_traffic_trigger("EgoAutonomous", true)),
    #                                     "failed", timeout=timeout)

    # write_and_wait_for_mirrored_message(vires.socket, 
    #                                     SCPMessage(get_xml_query_path("player", 1)),
    #                                     "failed",
    #                                     timeout=timeout)
    # write_and_wait_for_mirrored_message(vires.socket,
    #                                     SCPMessage(get_xml_traffic_action_autonomous("Ego", delayTime=0.5)),
    #                                         "action autonomous failed",
    #                                         timeout=timeout)

    # write_and_wait_for_mirrored_message(vires.socket, 
    #                                     SCPMessage(get_xml_query_posinertial()),
    #                                     "did not query PosInertial",
    #                                     timeout=timeout)                 

    # idle_and_print_messages(vires.socket, 10.0)


    # write_and_wait_for_mirrored_message(vires.socket, 
    #                                     SCPMessage(get_xml_simctrl_step(nsteps)),
    #                                     "did not step",
    #                                     timeout=timeout)


    # TODO(tim): put this into a "step" function
    message = SCPMessage(get_xml_simctrl_step(nsteps))
    write(vires.socket, message)

    sent::ETree = message_payload_to_etree(message)
    timeout = nsteps / 10.0
    received_mirrored = false
    received_taskcontrol_paused = false
    start_time = time()
    while (!received_mirrored || !received_taskcontrol_paused) && 
           time() - start_time < timeout

        received = read(vires.socket, SCPMessage)
        if  (string_from_buffer(received.header.sender) == string_from_buffer(received.header.receiver) == CLIENT_NAME) &&
             sent == message_payload_to_etree(received)
            received_mirrored = true
        else
            received_etree = message_payload_to_etree(received)
            if received_etree.name == "Info"
                index = findfirst(elem->isa(elem, ETree) && elem.name == "TaskState" && get(elem.attr, "name", "") == "TaskControl", received_etree.elements)
                if index != 0
                    element = received_etree.elements[index]
                    received_taskcontrol_paused = get(element.attr, "state", "") == "pause"
                end
            end 
        end
    end

    if !received_mirrored || !received_taskcontrol_paused
        error("timeout")
    end

    # write_and_wait_for_mirrored_message(vires.socket, 
    #                                     SCPMessage(get_xml_query_posinertial()),
    #                                     "did not query PosInertial",
    #                                     timeout=timeout)
    # idle_and_print_messages(vires.socket, 5.0)

    write_and_wait_for_mirrored_message(vires.socket, 
                                        SCPMessage(get_xml_record_stop()),
                                        "did not stop record",
                                        timeout=timeout)

    
    convert_recording_to_csv(dir, file_dat, vires, "Info", "Message",timeout=timeout)
    
    idle_and_print_messages(vires.socket, 3.0)

   




    # write(vires.socket, SCPMessage(get_xml_simctrl_step(1)))
    # write(vires.socket, SCPMessage(get_xml_query_posinertial()))
    # idle_and_print_messages(vires.socket, 10.0)
    # write(vires.socket, SCPMessage(get_xml_egoctrl_speed(egospeed)))
    # write(vires.socket, SCPMessage(get_xml_simctrl_step(10000)))
    # write(vires.socket, SCPMessage(get_xml_query_posinertial()))
    # sleep(5.0)
    # write(vires.socket, SCPMessage(get_xml_record_stop()))
    # write(vires.socket, SCPMessage(get_xml_replay_convert(dir, file_dat)))
    # idle_and_print_messages(vires.socket, 5.0)




    # write(vires.socket, SCPMessage("<Record stream=\"simulation\"><File path=\""*dir*"\" name=\""*file_dat*"\" overwrite=\"true\"/><Start/></Record>"))
    # write(vires.socket, SCPMessage("<SimCtrl> <Step size=\"1\"/> </SimCtrl>"))
    # write(vires.socket, SCPMessage("<Query entity=\"player\" id=\"1\"><PosInertial/></Query>")) #  type=\"reset\"
    # idle_and_print_messages(vires.socket, 2.0)
    # write(vires.socket, SCPMessage("SCP", "TaskControl","<EgoCtrl> <Speed value=\"29.06\"/> </EgoCtrl>"))
    # write(vires.socket, SCPMessage("<SimCtrl> <Step size=\"10000\"/> </SimCtrl>"))
    # write(vires.socket, SCPMessage("<Query entity=\"player\" id=\"1\"><PosInertial/></Query>"))
    # sleep(5.0)
    # write(vires.socket, SCPMessage("<Record stream=\"simulation\"><Stop/></Record>"))
    # write(vires.socket, SCPMessage("<Replay><File path=\""*dir*"\"  name=\""*file_dat*"\"/><Convert format=\"CSV\"/></Replay>"))

    #TODO(tim): remove old file_dat
end
function set_driver_behavior(
    vires::ViresConnection,
    def::DriverDefinition; 
    name::Union(Nothing,String)=nothing,
    id::Union(Nothing,Int)=nothing,
    visible::Union(Nothing,Bool)=nothing,
    timeout::Float64=TIMEOUT_DEFAULT
    )

    write_and_wait_for_mirrored_message(vires.socket,
        SCPMessage("SCP","TaskControl", Vires.get_xml_player_driver_behavior_normalized(def, name=name, id=id, visible=visible)),
        "set driver behavior timed out",
        timeout=timeout)
end
function convert_recording_to_csv(
    dir::String, file_dat::String, vires::ViresConnection, name::String, elementname::String; timeout::Float64=TIMEOUT_LONG_DEFAULT)
    # READING
    # TaskControl -> SCP: 
    #     PAYLOAD:      <Info level="info"> <Message popup="true" text="Data export complete."/> </Info>
    write(vires.socket, SCPMessage(get_xml_replay_convert(dir, file_dat)))


    done = false  
    start_time = time()
    while !done && time() - start_time < timeout
        received = read(vires.socket, SCPMessage)
        str = "<MSG>" * string_from_buffer(received.payload) * "</MSG>"
        for e in xp_parse(str).elements
            if isa(e, ETree)
                if e.name == "Info"
                    index = findfirst(elem->isa(elem, ETree) && elem.name == "Message", e.elements)
                    if index != 0
                        element = e.elements[index]
                        done = get(element.attr, "text", "") == "Data export complete."
                    end
                end
            end
        end 
    end

    # if !wait_for_packet_with_element(vires.socket, "Replay", "Convert", timeout=timeout)
    #     error("did not convert")
    # end
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

function scan_for_next_message(io::IO, timeout::Uint64=uint64(2e9), sleepduration::Float64=0.001)
    # start_time = time_ns()
    # found_magic_num = (read(io, Uint16) ==  VIRES_MAGIC_NUMBER)
    # while( time_ns()-start_time < timeout && !found_magic_num )
    #     sleep(sleepduration)
    #     found_magic_num = (read(io, Uint16) ==  VIRES_MAGIC_NUMBER)
    # end
    # found_magic_num
    while read(io, Uint16) != VIRES_MAGIC_NUMBER
        sleep(sleepduration)
    end
    true
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
    write(buf, message_out)
    println(STDOUT, "STRING BUFFER: ")
    println(STDOUT, bytes2hex(dat))
end

function idle_and_print_messages(io::IO, sleeptime::Float64)
    start_time = time()
    while time() - start_time < sleeptime
        message = read(io, SCPMessage)
        # if bytestring(message.payload[2:6]) != "Info "
            print_with_color(:red, "RECEIVED\n")
            print_message(message)
        # end
    end
end

get_xml_simctrl_loadscenario(scenario::String) = "<SimCtrl><LoadScenario filename=\""*scenario*"\"/></SimCtrl>"
get_xml_record_overwrite(dir::String, file_dat::String) = "<Record stream=\"simulation\"><File path=\""*dir*"\" name=\""*file_dat*"\" overwrite=\"true\"/><Start/></Record>"
get_xml_replay_convert(dir::String, file_dat::String) = "<Replay><File path=\""*dir*"\"  name=\""*file_dat*"\"/><Convert format=\"CSV\"/></Replay>"
get_xml_record_stop() = "<Record stream=\"simulation\"><Stop/></Record>"
get_xml_egoctrl_speed(speed::Float64) = @sprintf("<EgoCtrl><Speed value=\"%f\"/></EgoCtrl>", speed)

function get_xml_set_pos_inertial(
    id::Int,
    x::Real, # [m]
    y::Real, # [m]
    z::Real, # [m]
    hDeg::Real, # [Deg]
    pDeg::Real, # [Deg]
    rDeg::Real # [Deg]
    )

    @sprintf("<Set entity=\"player\" id=\"%d\"><PosInertial x=\"%f\" y=\"%f\" z=\"%f\" hDeg=\"%f\" pDeg=\"%f\" rDeg=\"%f\"/></Set>",
        id, x, y, z, hDeg, pDeg, rDeg)
end
get_xml_set_speed(id::Int, speed::Float64) = @sprintf("<Set entity=\"player\" id=\"%d\"><Speed value=\"%f\"/></Set>", id, speed)
get_xml_set_speed(name::String, speed::Float64) = @sprintf("<Set entity=\"player\" name=\"%s\"><Speed value=\"%f\"/></Set>", name, speed)
get_xml_set_path(id::Int, pathid::Int, s::Real) = @sprintf("<Set entity=\"player\" id=\"%d\"><Path id=\"%d\" s=\"%f\"/></Set>", id, pathid, s)

get_xml_simctrl_step(nsteps::Int) = @sprintf("<SimCtrl><Step size=\"%d\"/></SimCtrl>", nsteps)
get_xml_simctrl_init() = "<SimCtrl><Init/></SimCtrl>"
function get_xml_simctrl_init(mode::Symbol) # ∈ {:preparation, :operation}
    @assert(mode == :preparation || mode == :operation)
    "<SimCtrl><Init mode=\"" * string(mode) * "\"/></SimCtrl>"
end
get_xml_query(entity::String, id::Int) = @sprintf("<Query entity=\"%s\" id=\"%d\"> </Query>", entity, id)
get_xml_query_path(entity::String, id::Int) = @sprintf("<Query entity=\"%s\" id=\"%d\"><Path/></Query>", entity, id)
get_xml_query_posinertial() = "<Query entity=\"player\" id=\"1\"><PosInertial/></Query>"

function get_xml_player_driver_behavior_normalized(
    def::DriverDefinition; 
    name::Union(Nothing,String)=nothing,
    id::Union(Nothing,Int)=nothing,
    visible::Union(Nothing,Bool)=nothing
    )
    retval = "<Player"
    if isa(name,String)
        retval *= @sprintf(" name=\"%s\"", name)
    end
    if isa(id,Int)
        retval *= @sprintf(" id=\"%d\"", id)
    end
    if isa(visible,Bool)
        retval *= @sprintf(" visible=\"%s\"", visible)
    end
    #NOTE(Deon) not passing in use_of_indicator because its not in the API
    @sprintf("%s><DriverBehaviorNormalized desiredSpeed=\"%f\" desiredAcc=\"%f\" desiredDec=\"%f\" curveSpeed=\"%f\" observeSpeedLimits=\"%f\" distanceKeeping=\"%f\" laneKeeping=\"%f\" speedKeeping=\"%f\" laneChangeDyn=\"%f\" urgeToOvertake=\"%f\" keepRightRule=\"%f\" respondToTailgating=\"%f\" foresightDist=\"%f\" steeringDist=\"%f\" obeyTrafficSigns=\"%s\" obeyTrafficLights=\"%s\"/></Player>",
        retval, def.desired_velocity, def.desired_acceleraion, def.desired_deceleration,
        def.curve_speed, def.observe_speed_limits, def.distance_keeping, def.lane_keeping,
        def.speed_keeping, def.lane_change_dynamic, def.urge_to_overtake, def.keep_right_rule,
        def.respond_to_tailgate, def.foresight_distance, def.steering_distance,
        int(def.obey_traffic_signs), int(def.obey_traffic_lights)
    )
end
function get_xml_player_driver_input(;
    name::Union(Nothing,String)=nothing,
    id::Union(Nothing,Int)=nothing,
    visible::Union(Nothing,Bool)=nothing,
    override::Union(Nothing,Bool)=nothing,
    throttle::Union(Nothing,Float64)=nothing,
    brake::Union(Nothing,Float64)=nothing
    )

    @assert(isa(override,Bool) || isa(throttle,Float64) || isa(brake, Float64))

    retval = "<Player"
    if isa(name,String)
        retval *= @sprintf(" name=\"%s\"", name)
    end
    if isa(id,Int)
        retval *= @sprintf(" id=\"%d\"", id)
    end
    if isa(visible,Bool)
        retval *= @sprintf(" visible=\"%s\"", visible)
    end

    input_str ="" 
    if isa(override,Bool)
        input_str *= @sprintf(" override=\"%s\"",override)
    end
    if isa(throttle,Float64)
        if throttle < 0.0
            throttle = 0.0
            warn("Throttle value set to 0")
        elseif throttle > 1.0
            throttle = 1.0
            warn("Throttle value set to 1")
        end
        input_str *= @sprintf(" throttle=\"%f\"", throttle)
    end
    if isa(brake, Float64)
        if brake < 0.0
            brake = 0.0
            warn("brake value set to 0")
        elseif brake > 1.0
            brake = 1.0
            warn("brake value set to 1")
        end
        input_str *= @sprintf(" brake=\"%f\"", brake)
    end
    @sprintf("%s><DriverInput%s/></Player>", retval, input_str)
end

get_xml_traffic_trigger(id::String, active::Bool) = @sprintf("<Traffic><Trigger id=\"%s\" active=\"%s\"/></Traffic>", id, active)
function get_xml_traffic_action_autonomous(actor::String; 
    enable::Bool=true,
    force::Bool=true,
    delayTime::Union(Nothing,Real)=nothing,
    triggerRef::Union(Nothing,String)=nothing,
    activateOnExit::Union(Nothing,Bool)=nothing
    )

    retval = @sprintf("<Traffic><ActionAutonomous actor=\"%s\" enable=\"%s\" force=\"%s\"",
                       actor, enable, force)

    if isa(delayTime,String)
        retval *= @sprintf(" delayTime=\"%f\"", delayTime)
    end
    if isa(triggerRef, String)
        retval *= " triggerRef=\"" *triggerRef * "\""
    end
    if isa(activateOnExit,Bool)
        retval *= @sprintf(" activateOnExit=\"%s\"", activateOnExit)
    end 

    retval * "/></Traffic>"
end
function get_xml_traffic_action_speedchange(
    actor::String,
    target_speed::Float64, # [m/s]
    accel_to_use::Float64; # [m/s²]
    pivot::Union(Nothing,String)=nothing,
    force::Bool=true,
    delayTime::Union(Nothing,Float64)=nothing,
    triggerRef::Union(Nothing,String)=nothing,
    activateOnExit::Union(Nothing,Bool)=nothing
    )

    retval = @sprintf("<Traffic><ActionSpeedChange actor=\"%s\" target=\"%f\" rate=\"%f\" force=\"%s\"",
                       actor, target_speed, accel_to_use, force)

    if isa(pivot,String)
        retval *= " pivot=\"" * pivot * "\""
    end
    if isa(delayTime,String)
        retval *= " delayTime=\"" * delayTime * "\""
    end
    if isa(triggerRef, String)
        retval *= " triggerRef=\"" *triggerRef * "\""
    end
    if isa(activateOnExit,Bool)
        retval *= @sprintf(" activateOnExit=\"%s\"", activateOnExit)
    end 

    retval * "/></Traffic>"
end


end # module