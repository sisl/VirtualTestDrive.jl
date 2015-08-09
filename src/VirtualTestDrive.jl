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
    
    idle_and_print_messages,


#virescsv functions
    PlayerHeader,
    read_vires_csv,
    export_to_bosch_csv,

    inbounds,
    carind_inbounds,
    frameind_inbounds,

    set!,
    get_nplayers,
    get_nframes,
    get_column_symbol,
    get_pos_inertial,
    get_orientation

include("constants.jl")
include("rdb_definitions.jl")
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