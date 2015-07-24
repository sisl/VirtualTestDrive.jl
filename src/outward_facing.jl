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