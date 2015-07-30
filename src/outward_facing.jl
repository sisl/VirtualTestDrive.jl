function load_and_init(
    vires::ViresConnection,
    scenario::Union(String, ETree),
    mode::Symbol;
    timeout::Float64=TIMEOUT_LONG_DEFAULT,
    ntries::Int=3
    )
    
    completed = false
    while ntries > 0 && !completed
        ntries -= 1
        write(vires.SCP, SCPMessage(get_xml_simctrl_load_init(scenario, mode)))
        completed = wait_for_packet_with_element(vires.SCP, "SimCtrl", "InitDone", timeout=timeout)
    end
    if !completed
        error("failed to init")
    end
end
function record_scenario_run(
    vires::ViresConnection,
    nsteps::Int,
    destpath::String,
    timeout::Float64=TIMEOUT_DEFAULT)

    dir, file = splitdir(destpath)
    dir = isempty(dir) ? "." : dir
    file_base = splitext(file)[1]
    file_dat = file_base * ".dat"

    write_and_wait_for_mirrored_message(vires.SCP, 
                                        SCPMessage(get_xml_record_overwrite(dir, file_dat)),
                                        "record timed out",
                                        timeout=timeout)

    # NOTE(tim): for some reason we need this single step (which does not occur)
    write_and_wait_for_mirrored_message(vires.SCP, 
                                        SCPMessage(get_xml_simctrl_step(1)),
                                        "did not step",
                                        timeout=timeout)

    write_and_wait_for_mirrored_message(vires.SCP, 
                                        SCPMessage(get_xml_simctrl_step(nsteps)),
                                        "did not step",
                                        timeout=timeout)

    # tic()
    framecount = -1
    while framecount < nsteps-1
        pkg = read(vires.UDP, RDB_Package)
        if !isempty(pkg.entry_headers)
            if pkg.entry_headers[1].pkgId == RDB_PKG_ID_END_OF_FRAME
                framecount = pkg.header.frameNo
                # println("found frame: ", framecount, " / ", nsteps)
            end
        end
    end
    # println("done!", toc())

    # finished = false
    # timeout = 5.0
    # start_time = time()
    # while !finished && time() - start_time < timeout
    #     pkg = read(vires.UDP, RDB_Package)
    #     if !isempty(pkg.entry_headers)
    #         finished = pkg.entry_headers[1].pkgId == RDB_PKG_ID_START_OF_FRAME
    #     end
    # end
    # if !finished
    #     print_with_color(:red, STDOUT, "did not finish UDP packet!")
    # else
    #     println("found start!")
    # end

    # timeout = 5.0
    # start_time = time()
    # finished = false
    # while !finished && time() - start_time < timeout
    #     pkg = read(vires.UDP, RDB_Package)
    #     println(pkg)
    #     if !isempty(pkg.entry_headers)
    #         finished = pkg.entry_headers[1].pkgId == RDB_PKG_ID_END_OF_FRAME
    #     end 
    # end
    # if !finished
    #     print_with_color(:red, STDOUT, "did not finish UDP packet!")
    # else
    #     println("found end!")
    # end

    # # TODO(tim): put this into a "step" function
    # message = SCPMessage(get_xml_simctrl_step(nsteps))
    # write(vires.SCP, message)

    # sent::ETree = message_payload_to_etree(message)
    # timeout = nsteps / 5.0
    # received_mirrored = false
    # received_taskcontrol_run = false
    # received_taskcontrol_paused = false
    # start_time = time()
    # while (!received_mirrored || !received_taskcontrol_paused) && 
    #        time() - start_time < timeout

    #     received = read(vires.SCP, SCPMessage)
    #     if  (string_from_buffer(received.header.sender) == string_from_buffer(received.header.receiver) == CLIENT_NAME) &&
    #          sent == message_payload_to_etree(received)
    #         received_mirrored = true
    #     else
    #         received_etree = message_payload_to_etree(received)
    #         if received_etree.name == "Info"
    #             index = findfirst(elem->isa(elem, ETree) && elem.name == "TaskState" && get(elem.attr, "name", "") == "TaskControl", received_etree.elements)
    #             if index != 0
    #                 element = received_etree.elements[index]
    #                 state = get(element.attr, "state", "")
    #                 if !received_taskcontrol_run 
    #                     received_taskcontrol_run = state == "run"
    #                 else
    #                     received_taskcontrol_paused = state == "pause"
    #                 end
    #             end
    #         end 
    #     end
    # end

    # println(time() - start_time < timeout)
    # println("received_mirrored: ", received_mirrored)
    # println("received_taskcontrol_paused: ", received_taskcontrol_paused)
    # println(STDOUT, read(vires.UDP, RDB_Package))

    # if !received_mirrored || !received_taskcontrol_paused
    #     error("timeout")
    # end

    # write_and_wait_for_mirrored_message(vires.SCP, 
    #                                     SCPMessage(get_xml_query_posinertial()),
    #                                     "did not query PosInertial",
    #                                     timeout=timeout)
    # idle_and_print_messages(vires.SCP, 5.0)

    write_and_wait_for_mirrored_message(vires.SCP, 
                                        SCPMessage(get_xml_record_stop()),
                                        "did not stop record",
                                        timeout=timeout)

    
    convert_recording_to_csv(dir, file_dat, vires, timeout=timeout)

    # idle_and_print_messages(vires.SCP, 3.0)
end
function set_driver_behavior(
    vires::ViresConnection,
    def::DriverDefinition; 
    name::Union(Nothing,String)=nothing,
    id::Union(Nothing,Int)=nothing,
    visible::Union(Nothing,Bool)=nothing,
    timeout::Float64=TIMEOUT_DEFAULT
    )

    write_and_wait_for_mirrored_message(vires.SCP,
        SCPMessage("SCP","TaskControl", get_xml_player_driver_behavior_normalized(def, name=name, id=id, visible=visible)),
        "set driver behavior timed out",
        timeout=timeout)
end
function convert_recording_to_csv(
    dir::String,
    file_dat::String,
    vires::ViresConnection;
    timeout::Float64=TIMEOUT_LONG_DEFAULT
    )

    write(vires.SCP, SCPMessage(get_xml_replay_convert(dir, file_dat)))

    finished = false  
    start_time = time()
    while !finished && time() - start_time < timeout
        received = read(vires.SCP, SCPMessage)
        str = "<MSG>" * string_from_buffer(received.payload) * "</MSG>"
        for node in xp_parse(str).elements
            if isa(node, ETree)
                if node.name == "Info"
                    index = findfirst(elem->isa(elem, ETree) && elem.name == "Message", node.elements)
                    if index != 0
                        element = node.elements[index]
                        finished = get(element.attr, "text", "") == "Data export complete."
                    end
                end
            end
        end 
    end
end