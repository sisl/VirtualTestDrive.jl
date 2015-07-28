module VirtualTestDrive
    
using LibExpat
using Compat

import Base: TcpSocket, ==

macro lintpragma(s)
end

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

    load_and_init,
    record_scenario_run,
    set_driver_behavior,
    convert_recording_to_csv,

    write_and_wait_for_mirrored_message,

    get_xml_traffic_action_autonomous,
    
    idle_and_print_messages

include("constants.jl")
include("system.jl")
include("driver_definition.jl")
include("io.jl")
include("viresconnection.jl")
include("xml_utils.jl")
include("scp_xml.jl")
include("outward_facing.jl")

end # module