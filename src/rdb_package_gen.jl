

create_udp_entry(packageid::Integer) = create_package(rdb_pkg_id_to_type(packageid))
function create_udp_entry(::Type{RDB_SYNC_t},
    mask::Uint32=0x00000000,
    cmdMask::Uint32=RDB_SYNC_CMD_RENDER_SINGLE_FRAME, #RDB_SYNC_CMD_RENDER_CONTINUOUS,
    systemTime::Cdouble=time()
    )

    RDB_SYNC_t(mask, cmdMask, systemTime)
end
function create_udp_entry(::Type{RDB_TRIGGER_t},
    deltaT::Cfloat,
    frameNo::Uint32,
    spare::Int32=convert(Int32, 0)
    )

    RDB_TRIGGER_t(deltaT, frameNo, spare)
end

function create_udp_entry_header{T<:RDB_PACKAGE_ELEMENT}(elements::Vector{T}, flags::Uint16=0x0000)
    headerSize = sizeof(RDB_MSG_ENTRY_HDR_t)
    dataSize = sizeof(elements)
    elementSize = div(dataSize, length(elements))
    pkgId = rdb_type_to_pkg_id(T)
    RDB_MSG_ENTRY_HDR_t(headerSize, dataSize, elementSize, pkgId, flags)
end