
type RDB_Package
    header::RDB_MSG_HDR_t
    entry_headers::Vector{RDB_MSG_ENTRY_HDR_t}
    data_blocks::Vector{Any}
end

function Base.read(io::IO, ::Type{RDB_MSG_HDR_t}, already_read_header::Bool=false)
    # if !already_read_header
    #     @assert(scan_for_value(io, RDB_MAGIC_NO, 99999.0))
    # end
    while read(io, Uint16) != RDB_MAGIC_NO
        # do nothing
    end

    version = read(io, Uint16)
    headerSize = read(io, Uint32)
    dataSize = read(io, Uint32)
    frameNo = read(io, Uint32)
    simTime = read(io, Cdouble)
    RDB_MSG_HDR_t(convert(Uint16, RDB_MAGIC_NO), version, headerSize, dataSize, frameNo, simTime)
end