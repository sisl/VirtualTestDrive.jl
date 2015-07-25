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

include("constants.jl")
include("driver_definition.jl")
include("io.jl")
include("viresconnection.jl")
include("xml_utils.jl")
include("scp_xml.jl")
include("outward_facing.jl")

end # module