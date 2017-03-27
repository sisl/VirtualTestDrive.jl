

create_udp_entry(packageid::Integer) = create_package(rdb_pkg_id_to_type(packageid))
function create_udp_entry(::Type{RDB_SYNC_t},
    mask::UInt32=0x00000000,
    cmdMask::UInt32=RDB_SYNC_CMD_RENDER_SINGLE_FRAME, #RDB_SYNC_CMD_RENDER_CONTINUOUS,
    systemTime::Cdouble=time()
    )

    RDB_SYNC_t(mask, cmdMask, systemTime)
end
function create_udp_entry(::Type{RDB_TRIGGER_t},
    deltaT::Cfloat,
    frameNo::UInt32,
    spare::Int32=convert(Int32, 0)
    )

    RDB_TRIGGER_t(deltaT, frameNo, spare)
end

function create_udp_entry_header{T<:RDB_PACKAGE_ELEMENT}(elements::Vector{T}, flags::UInt16=0x0000)
    headerSize = sizeof(RDB_MSG_ENTRY_HDR_t)
    dataSize = sizeof(elements)
    elementSize = div(dataSize, length(elements))
    #pkgId = rdb_type_to_pkg_id(T)
    pkgId = rdb_type_to_pkg_id(elements[1])
    RDB_MSG_ENTRY_HDR_t(headerSize, dataSize, elementSize, pkgId, flags)
end

function create_udp_entry(::Type{RDB_DRIVER_CTRL_t},
    playerId::UInt32;
    steeringWheel::Cfloat=convert(Cfloat,0),
    steeringSpeed::Cfloat=convert(Cfloat,0),
    throttlePedal::Cfloat=convert(Cfloat,0),
    brakePedal::Cfloat=convert(Cfloat,0),
    clutchPedal::Cfloat=convert(Cfloat,0),
    accelTgt::Cfloat=convert(Cfloat,0),
    steeringTgt::Cfloat=convert(Cfloat,0),
    curvatureTgt::Cdouble=convert(Cdouble,0),
    steeringTorque::Cfloat=convert(Cfloat,0),
    engineTorqueTgt::Cfloat=convert(Cfloat,0),
    speedTgt::Cfloat=convert(Cfloat,0),
    gear::UInt8=convert(UInt8,0),
    sourceId::UInt8=convert(UInt8,0),
    spare0::Tuple{UInt8, UInt8}=(convert(UInt8,0),convert(UInt8,0)),
    validityFlags::UInt32=convert(UInt32,0),
    flags::UInt32=convert(UInt32,0),
    mockupInput0::UInt32=convert(UInt32,0),
    mockupInput1::UInt32=convert(UInt32,0),
    mockupInput2::UInt32=convert(UInt32,0),
    spare::UInt32=convert(UInt32,0)
    )

    RDB_DRIVER_CTRL_t(    playerId,
    steeringWheel,
    steeringSpeed,
    throttlePedal,
    brakePedal,
    clutchPedal,
    accelTgt,
    steeringTgt,
    curvatureTgt,
    steeringTorque,
    engineTorqueTgt,
    speedTgt,
    gear,
    sourceId,
    spare0,
    validityFlags,
    flags,
    mockupInput0,
    mockupInput1,
    mockupInput2,
    spare)
        
end