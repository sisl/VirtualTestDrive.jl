
type RDB_Package
    header::RDB_MSG_HDR_t
    entry_headers::Vector{RDB_MSG_ENTRY_HDR_t}
    data_blocks::Vector{Vector{Uint8}}
end

function Base.read(io::IO, ::Type{RDB_MSG_HDR_t}, already_read_magic_no::Bool=false;
    timeout = 2.0
    )
    if !already_read_magic_no
        scan_for_value(io, convert(Uint16, RDB_MAGIC_NO), timeout)
        # while read(io, Uint16) != RDB_MAGIC_NO
        #     # do nothing
        # end
    end

    version = read(io, Uint16)
    headerSize = read(io, Uint32)
    dataSize = read(io, Uint32)
    frameNo = read(io, Uint32)
    simTime = read(io, Cdouble)
    RDB_MSG_HDR_t(convert(Uint16, RDB_MAGIC_NO), version, headerSize, dataSize, frameNo, simTime)
end
function Base.show(io::IO, header::RDB_MSG_HDR_t)
    println(io, "RDB_MSG_HDR_t:")
    println(io, "\tmagicNo:    %s", hex(header.magicNo))
    println(io, "\tversion:    %s", hex(header.version))
    println(io, "\theaderSize: %d", header.headerSize)
    println(io, "\tdataSize:   %d", header.dataSize)
    println(io, "\tframeNo:    %d", header.frameNo)
    @printf(io, "\tsimTime:    %.16e", header.simTime)
end
function Base.print(io::IO, header::RDB_MSG_HDR_t)
    @printf(io, "(%d %d %10.3f)", header.dataSize, header.frameNo, header.simTime)
end

function Base.read(io, ::Type{RDB_MSG_ENTRY_HDR_t})
    headerSize = read(io, Uint32)
    dataSize = read(io, Uint32)
    elementSize = read(io, Uint32)
    pkgId = read(io, Uint16)
    flags = read(io, Uint16)
    RDB_MSG_ENTRY_HDR_t(headerSize, dataSize, elementSize, pkgId, flags)
end

function Base.read(io::IO, ::Type{RDB_Package}, already_read_magic_no::Bool=false)

    header = read(io, RDB_MSG_HDR_t, already_read_magic_no)
    entry_headers = RDB_MSG_ENTRY_HDR_t[]
    data_blocks = Vector{Uint8}[]

    bytes_remaining = header.dataSize
    while bytes_remaining > 0
        entry_header = read(io, RDB_MSG_ENTRY_HDR_t)
        bytes_remaining -= entry_header.headerSize

        data_block = readbytes(io, entry_header.dataSize)
        bytes_remaining -= entry_header.dataSize

        push!(entry_headers, entry_header)
        push!(data_blocks, data_block)
    end

    RDB_Package(header, entry_headers, data_blocks)
end
function Base.show(io::IO, pkg::RDB_Package)
    println(io, "RDB_Package:")
    println(io, "header: ", pkg.header)
    println(io, "nentries: ", length(pkg.entry_headers))
    for eh in pkg.entry_headers
        @printf(io, "\t[%d %d %s %s]\n", eh.dataSize, eh.elementSize, rdb_pkg_id_to_string(eh.pkgId), hex(eh.flags))
    end
end

