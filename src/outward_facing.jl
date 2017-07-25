function load_and_init(
    vires::ViresConnection,
    #scenario::Union(String, ETree),
    scenario::Union{String, ETree},
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

function step_with_udp_checking_frameid(vires::ViresConnection, nsteps::Int, frame_start::Int=0)

    #=
    Make sure that UDP messages are received from frame_start to frame_start+nsteps-1
    =#

    # tic()
    stepcount = 0
    framecount = frame_start-1
    while stepcount < nsteps
        stepcount += 1
        pkg = read(vires.UDP, RDB_Package)
        if !isempty(pkg.entry_headers)
            if pkg.entry_headers[1].pkgId == RDB_PKG_ID_END_OF_FRAME
                framecount = pkg.header.frameNo
                # println("found frame: ", framecount, " / ", nsteps)
            end
        end
    end
    # println("done!", toc())
end
function step_with_udp_explicit_stepwidth(
    vires::ViresConnection,
    nsteps::Int;
    framestep::Real=0.04, # [s]
    frame_start::Int=0,
    simtime_start::Float64=0.0
    )

    #=
    Make sure that UDP messages are received from frame_start to frame_start+nsteps-1
    =#

    stepcount = 0
    Δt = convert(Cfloat, framestep)
    simTime = simtime_start
    frameNo = convert(UInt32, frame_start)

   # playerId:        1
   # steeringWheel:   +0.0000000000000000e+00
   # steeringSpeed:   +6.2826038338243961e-03
   # throttlePedal:   +0.0000000000000000e+00
   # brakePedal:      +0.0000000000000000e+00
   # clutchPedal:     +0.0000000000000000e+00
   # accelTgt:        +3.4999719355255365e-04
   # steeringTgt:     -8.7401109340135008e-05
   # curvatureTgt:    +0.0000000000000000e+00
   # steeringTorque:  +0.0000000000000000e+00
   # engineTorqueTgt: +0.0000000000000000e+00
   # speedTgt:        +0.0000000000000000e+00
   # gear:            4
   # sourceId:        0
   # spare0:          (0, 0)
   # validityFlags:   40e2 <flags, gear, tgt accel, tgt steer, steer speed>
   # flags:           0
   # mockupInput0:    0
   # mockupInput1:    0
   # mockupInput2:    0
   # spare:           0

    trigger = RDB_TRIGGER_t(Δt, frameNo, 0x00000000)

    # myDriver->playerId       = mOwnPlayerId;
    # myDriver->steeringWheel  = 9.0 * sin( 0.8 * simTime ); 
    # myDriver->throttlePedal  = 0.5 * ( 1 + sin( 0.8 * simTime ) );
    # myDriver->brakePedal     = 0.0;
    # myDriver->clutchPedal    = 0.0f;
    # myDriver->gear           = RDB_GEAR_BOX_POS_D;  
    # myDriver->validityFlags  = RDB_DRIVER_INPUT_VALIDITY_STEERING_WHEEL | RDB_DRIVER_INPUT_VALIDITY_THROTTLE | RDB_DRIVER_INPUT_VALIDITY_BRAKE;

    # ctrl = RDB_DRIVER_CTRL_t(
        # convert(Uint32, 1), # playerId
        # convert(Cfloat, 4.0), # steeringWheel
        # convert(Cfloat, 0.0), # steeringSpeed::Cfloat
        # convert(Cfloat, 1.0), # throttlePedal::Cfloat
        # convert(Cfloat, 0.0), # brakePedal::Cfloat
        # convert(Cfloat, 0.0), # clutchPedal::Cfloat
        # convert(Cfloat, 0.0), # accelTgt::Cfloat
        # convert(Cfloat, 0.0), # steeringTgt::Cfloat
        # convert(Cdouble, 0.0), # curvatureTgt::Cdouble
        # convert(Cfloat, 0.0), # steeringTorque::Cfloat
        # convert(Cfloat, 0.0), # engineTorqueTgt::Cfloat
        # convert(Cfloat, 0.0), # speedTgt::Cfloat
        # convert(Uint8, RDB_GEAR_BOX_POS_D), # gear::Uint8
        # convert(Uint8, RDB_DRIVER_SOURCE_UNKNOWN), # sourceId::Uint8 
        # (convert(Uint8, 0), convert(Uint8, 0)), # spare0::(Uint8, Uint8)
        # convert(Uint32, RDB_DRIVER_INPUT_VALIDITY_STEERING_WHEEL | RDB_DRIVER_INPUT_VALIDITY_THROTTLE | 
        #                 RDB_DRIVER_INPUT_VALIDITY_BRAKE), # validityFlags::Uint32
        # convert(Uint32, RDB_DRIVER_FLAG_NONE), # flags::Uint32
        # convert(Uint32, 0), # mockupInput0::Uint32
        # convert(Uint32, 0), # mockupInput1::Uint32
        # convert(Uint32, 0), # mockupInput2::Uint32
        # convert(Uint32, 0), # spare::Uint32        
        # )
    # start_of_frame = RDB_START_OF_FRAME_t()
    # end_of_frame = RDB_END_OF_FRAME_t()

    println("listening")
    
    while stepcount < nsteps
        stepcount += 1

        finished = false
        while !finished
            pkg = read(vires.UDP, RDB_Package)
            println(pkg)
            if !isempty(pkg.entry_headers)
                if pkg.entry_headers[1].pkgId == RDB_PKG_ID_START_OF_FRAME
                    frameNo = pkg.header.frameNo
                    simTime = pkg.header.simTime
                elseif pkg.entry_headers[1].pkgId == RDB_PKG_ID_END_OF_FRAME
                    finished = true
                # elseif pkg.entry_headers[1].pkgId == RDB_PKG_ID_DRIVER_CTRL
                #     println(STDOUT, bytes2hex(pkg.data_blocks[1]))
                    # buf = IOBuffer(pkg.data_blocks[1])
                    # ctrl2 = read(buf, RDB_DRIVER_CTRL_t)
                    # println(ctrl2)
                end
            end
        end

        # println("frameNo: ", frameNo)
        trigger.frameNo = frameNo + 1
        # write_udp_packet(vires.UDP, start_of_frame, frameNo, simTime)
        # write_bytehex_to_stdout((buf)->write_udp_packet(buf, ctrl, frameNo, simTime))
        # write_udp_packet(vires.UDP, ctrl, frameNo, simTime)
        write_udp_packet(vires.UDP, trigger, frameNo, simTime)
        # write_udp_packet(vires.UDP, end_of_frame, frameNo, simTime)
        # sleep(2.0)

        # ctrl.steeringWheel  = 9.0 * sin( 0.8 * simTime )
        # ctrl.throttlePedal  = 0.5 * ( 1 + sin( 0.8 * simTime ) )
        # ctrl.brakePedal     = 0.0
        # ctrl.clutchPedal    = 0.0
        # ctrl.gear           = RDB_GEAR_BOX_POS_D
        # ctrl.validityFlags  = RDB_DRIVER_INPUT_VALIDITY_STEERING_WHEEL | RDB_DRIVER_INPUT_VALIDITY_THROTTLE | RDB_DRIVER_INPUT_VALIDITY_BRAKE

        # write_udp_packet(vires.UDP, start_of_frame, frameNo, simTime)
        # write_udp_packet(vires.UDP, ctrl, convert(Uint32, frameNo+1), convert(Cfloat, simTime))
        # write_udp_packet(vires.UDP, trigger, frameNo, simTime)
        # write_udp_packet(vires.UDP, end_of_frame, frameNo, simTime)
    end
end
function step_with_udp_authorization(vires::ViresConnection, nsteps::Int)

    udp_sync = create_udp_entry(RDB_SYNC_t, vires.sync_mask)
    println("MASK: ", vires.sync_mask)
    println("UDP SYNC: ", udp_sync)

    tic()
    stepcount = 0
    while stepcount < nsteps
        stepcount += 1

        pkg = read(vires.UDP, RDB_Package)

        if !isempty(pkg.entry_headers)
            if pkg.entry_headers[1].pkgId == RDB_PKG_ID_START_OF_FRAME
                framecount = pkg.header.frameNo
                println("found frame: ", framecount, " / ", nsteps)

                println("received: ")
                println(pkg)

                write_udp_packet(vires.UDP, udp_sync, pkg.header.frameNo, pkg.header.simTime)

                # buf = IOBuffer()
                # write_udp_packet(buf, udp_sync, pkg.header.frameNo, pkg.header.simTime)
                # arr = takebuf_array(buf)
                # println(STDOUT, bytes2hex(arr))

                # write_udp_packet(buf, udp_sync, pkg.header.frameNo, pkg.header.simTime)
                # buf2 = IOBuffer(takebuf_string(buf))
                # pkg2 = read_special(buf2, RDB_Package)
                # println(STDOUT, pkg2)
            end
        end
    end
    toc()
end

function record_scenario_run(
    vires::ViresConnection,
    nsteps::Int,
    destpath::String,
    timeout::Float64=TIMEOUT_DEFAULT;
    remove_dat_files=true
    )

    dir, file = splitdir(destpath)
    dir = isempty(dir) ? "." : dir
    file_base = splitext(file)[1]
    file_dat = file_base * ".dat"

    write_and_wait_for_mirrored_message(vires.SCP, 
                                        SCPMessage(get_xml_record_overwrite(dir, file_dat)),
                                        "record timed out",
                                        timeout=timeout)

    # create_camera_relative_to_ego(vires, dx=18.0, dz=100.0)

    # write_and_wait_for_mirrored_message(vires.SCP,
    #     SCPMessage("<Player name=\"Ego\" visible=\"true\"/>"),
    #     "make player visible timed out")
    # write_and_wait_for_mirrored_message(vires.SCP,
    #     SCPMessage("<Camera><PosEyepoint player=\"Ego\"/><ViewRelative dh=\"0.0\"  dp=\"0.0\" dr=\"0.0\"/></Camera>"),
    #     "set camera timed out")

    write_and_wait_for_mirrored_message(vires.SCP, 
                                        SCPMessage("<SimCtrl><Start/></SimCtrl>"),
                                        "did not step",
                                        timeout=timeout)

    # write_and_wait_for_mirrored_message(vires.SCP, 
    #                                     SCPMessage("<Player name=\"Ego\"><Driver ctrlLatLong=\"extern\"/></Player>"),
    #                                     "record timed out",
    #                                     timeout=timeout)

    # if vires.registered_to_authorize_framestep
    #     step_with_udp_authorization(vires, nsteps)
    # else
    #     step_with_udp_checking_frameid(vires, nsteps)
    # end
    step_with_udp_explicit_stepwidth(vires, nsteps)

    write_and_wait_for_mirrored_message(vires.SCP, 
                                        SCPMessage(get_xml_record_stop()),
                                        "did not stop record",
                                        timeout=timeout)

    
    convert_recording_to_csv(dir, file_dat, vires, timeout=timeout)

    if remove_dat_files
        rm(joinpath(dir, file_dat)) # remove the .dat files
    end

    # idle_and_print_messages(vires.SCP, 3.0)
end
function set_driver_behavior(
    vires::ViresConnection,
    def::DriverBehavior; 
    #name::Union(Nothing,String)=nothing,
    name::Union{Void,String}=nothing,
    #id::Union(Nothing,Int)=nothing,
    id::Union{Void,Int}=nothing,
    #visible::Union(Nothing,Bool)=nothing,
    visible::Union{Void,Bool}=nothing,
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
        root = message_payload_to_etree(read(vires.SCP, SCPMessage))
        if root.name == "Info"
            index = findfirst(elem->isa(elem, ETree) && elem.name == "Message", root.elements)
            if index != 0
                element = root.elements[index]
                finished = get(element.attr, "text", "") == "Data export complete."
            end
        end
    end
end

function create_camera_directly_above_ego(
    vires::ViresConnection;
    distance::Float64=50.0
    )

    write_and_wait_for_mirrored_message(vires.SCP,
        SCPMessage("<Player name=\"Ego\" visible=\"true\"/>"),
        "make player visible timed out")
    write_and_wait_for_mirrored_message(vires.SCP,
        SCPMessage("<Camera><PosTether player=\"Ego\" distance=\"" * string(distance) * 
                             "\" azimuth=\"3.14159\" elevation=\"1.5708\" slew=\"1\" stayLevel=\"true\"/><ViewPlayer player=\"Ego\"/></Camera>"),
        "set camera timed out")
end
function create_camera_relative_to_ego(
    vires::ViresConnection;
    dx::Float64=0.0,
    dy::Float64=0.0,
    dz::Float64=50.0,
    )

    write_and_wait_for_mirrored_message(vires.SCP,
        SCPMessage("<Player name=\"Ego\" visible=\"true\"/>"),
        "make player visible timed out")
    write_and_wait_for_mirrored_message(vires.SCP,
        SCPMessage("<Camera><PosRelative player=\"Bot03\" dx=\"" * string(dx) * "\" " *
                                                       "dy=\"" * string(dy) * "\" " *
                                                       "dz=\"" * string(dz) * "\"/>" *
                            "<ViewRelative dh=\"0.0\" dp=\"1.5708\" dr=\"0.0\"/></Camera>"),
        "set camera timed out")
end

function register_to_authorize_framesteps!(
    vires::ViresConnection, timeout::Float64=TIMEOUT_DEFAULT;
    source="USER")

    mask = -1

    println(vires.registered_to_authorize_framestep)

    if !vires.registered_to_authorize_framestep

        write(vires.SCP, SCPMessage("SCP","TaskControl", get_xml_query_sync(source=source)))

        finished = false  
        start_time = time()
        while !finished && time() - start_time < timeout
            root = message_payload_to_etree(read(vires.SCP, SCPMessage))
            if root.name == "Reply" && get(root.attr, "entity", "") == "RDB"
                index = findfirst(elem->isa(elem, ETree) && elem.name == "Sync", root.elements)
                if index != 0
                    element = root.elements[index]
                    mask = int(get(element.attr, "mask", "-1"))
                    finished = get(element.attr, "source", "") == source

                    if get(element.attr, "mode", "") != "frame"
                        mask = -1
                    end
                end
            end 
        end

        if mask ≥ 0
            vires.registered_to_authorize_framestep = true
            vires.sync_mask = convert(Uint32, mask)
        end
    end
end
function unregister_to_authorize_framesteps!(
    vires::ViresConnection,
    timeout::Float64=TIMEOUT_DEFAULT;
    source="USER")

    freed = true

    if vires.registered_to_authorize_framestep

        write(vires.SCP, SCPMessage("SCP","TaskControl", get_xml_query_sync(source=source, delete=true)))

        finished = false  
        start_time = time()
        while !finished && time() - start_time < timeout
            root = message_payload_to_etree(read(vires.SCP, SCPMessage))
            if root.name == "Reply" && get(root.attr, "entity", "") == "RDB"
                index = findfirst(elem->isa(elem, ETree) && elem.name == "Sync", root.elements)
                if index != 0
                    element = root.elements[index]
                    finished = get(element.attr, "source", "") == source
                    freed = get(element.attr, "mode", "") == "free"
                end
            end
        end
    end

    freed
end
