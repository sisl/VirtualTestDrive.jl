module VirtualTestDrive
    
using LibExpat
using Compat
using DataFrames

import Base: TcpSocket, ==

macro lintpragma(s)
end

export
    ViresConnection, 
    SCPMessage,
    DriverBehavior,

    BRISK_DRIVER,
    COMFORTABLE_DRIVER,
    DEFAULT_DRIVER,
    HASTY_DRIVER,
    INSECURE_DRIVER,

    find_vtd_directory,
    start_vires_vtd_tasks,
    stop_vires_components,
    rdbsniffer,

    load_and_init,
    record_scenario_run,
    set_driver_behavior,
    convert_recording_to_csv,
    register_to_authorize_framesteps!,
    unregister_to_authorize_framesteps!,

    create_camera_directly_above_ego,
    create_camera_relative_to_ego,
    
    step_with_udp_checking_frameid,
    step_with_udp_authorization,
    step_with_udp_explicit_stepwidth,

    write_and_wait_for_mirrored_message,

    get_xml_traffic_action_autonomous,
    
    idle_and_print_messages

    include("constants.jl")
    include("rdb_definitions.jl")
    include("rdb_package_gen.jl")
    include("rdb.jl")
    include("system.jl")
    include("driver_definition.jl")
    include("io.jl")
    include("viresconnection.jl")
    include("xml_utils.jl")
    include("scp_xml.jl")
    include("outward_facing.jl")
    include("virescsv.jl")

end # module