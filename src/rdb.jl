
type RDB_Package
    header::RDB_MSG_HDR_t
    entry_headers::Vector{RDB_MSG_ENTRY_HDR_t}
    data_blocks::Vector{Vector{Uint8}}
end

function Base.read(io::IO, ::Type{RDB_MSG_HDR_t}, already_read_magic_no::Bool=false)
    if !already_read_magic_no
        scan_for_value(io, RDB_MAGIC_NO)
    end

    version = read(io, Uint16)
    headerSize = read(io, Uint32)
    dataSize = read(io, Uint32)
    frameNo = read(io, Uint32)
    simTime = read(io, Cdouble)
    RDB_MSG_HDR_t(RDB_MAGIC_NO, version, headerSize, dataSize, frameNo, simTime)
end
function Base.read!(io::IO, struct::RDB_MSG_HDR_t, already_read_magic_no::Bool=false)
    if !already_read_magic_no
        scan_for_value(io, RDB_MAGIC_NO)
    end

    struct.magicNo = RDB_MAGIC_NO
    struct.version = read(io, Uint16)
    struct.headerSize = read(io, Uint32)
    struct.dataSize = read(io, Uint32)
    struct.frameNo = read(io, Uint32)
    struct.simTime = read(io, Cdouble)
    struct
end
# function Base.write(io::IO, header::RDB_MSG_HDR_t)
#     write(io, header.magicNo)
#     write(io, header.version)
#     write(io, header.headerSize)
#     write(io, header.dataSize)
#     write(io, header.frameNo)
#     write(io, header.simTime)
# end
# function Base.show(io::IO, header::RDB_MSG_HDR_t)
#     println(io, "RDB_MSG_HDR_t:")
#     println(io, "\tmagicNo:    %s", hex(header.magicNo))
#     println(io, "\tversion:    %s", hex(header.version))
#     println(io, "\theaderSize: %d", header.headerSize)
#     println(io, "\tdataSize:   %d", header.dataSize)
#     println(io, "\tframeNo:    %d", header.frameNo)
#     @printf(io, "\tsimTime:    %.16e", header.simTime)
# end
function Base.print(io::IO, header::RDB_MSG_HDR_t)

    @printf(io, "(%d %d %10.3f)", header.dataSize, header.frameNo, header.simTime)
end

# function Base.read(io, ::Type{RDB_MSG_ENTRY_HDR_t})
#     headerSize = read(io, Uint32)
#     dataSize = read(io, Uint32)
#     elementSize = read(io, Uint32)
#     pkgId = read(io, Uint16)
#     flags = read(io, Uint16)
#     RDB_MSG_ENTRY_HDR_t(headerSize, dataSize, elementSize, pkgId, flags)
# end
# function Base.write(io::IO, header::RDB_MSG_ENTRY_HDR_t)
#     write(io, header.headerSize)
#     write(io, header.dataSize)
#     write(io, header.elementSize)
#     write(io, header.pkgId)
#     write(io, header.flags)
# end

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

function write_udp_packet(io::IO, elem::RDB_PACKAGE_ELEMENT, frameNo::Integer, simTime::Real, flags::Uint16=0x0000)

    # println("sending $(typeof(elem)) packet")

    # write the RDB_MSG_HDR_t
    write(io, RDB_MAGIC_NO)
    write(io, RDB_VERSION)
    write(io, convert(Uint32, sizeof(RDB_MSG_HDR_t)))
    write(io, convert(Uint32, sizeof(elem) + sizeof(RDB_MSG_ENTRY_HDR_t)))
    write(io, convert(Uint32, frameNo))
    write(io, convert(Cdouble, simTime))

    # write the RDB_MSG_ENTRY_HDR_t
    write(io, convert(Uint32, sizeof(RDB_MSG_ENTRY_HDR_t)))
    write(io, convert(Uint32, sizeof(elem)))
    write(io, convert(Uint32, sizeof(elem)))
    write(io, rdb_type_to_pkg_id(elem)::Uint16)
    write(io, flags)

    # write the entry
    write(io, elem)
end

function write_udp_packet(io::IO, ::RDB_START_OF_FRAME_t, frameNo::Integer, simTime::Real, flags::Uint16=0x0000)

    # println("sending start of frame")

    # write the RDB_MSG_HDR_t
    write(io, RDB_MAGIC_NO)
    write(io, RDB_VERSION)
    write(io, convert(Uint32, sizeof(RDB_MSG_HDR_t)))
    write(io, convert(Uint32, sizeof(RDB_MSG_ENTRY_HDR_t)))
    write(io, convert(Uint32, frameNo))
    write(io, convert(Cdouble, simTime))

    # write the RDB_MSG_ENTRY_HDR_t
    write(io, convert(Uint32, sizeof(RDB_MSG_ENTRY_HDR_t)))
    write(io, convert(Uint32, 0))
    write(io, convert(Uint32, 0))
    write(io, RDB_PKG_ID_START_OF_FRAME::Uint16)
    write(io, flags)
end
function write_udp_packet(io::IO, ::RDB_END_OF_FRAME_t, frameNo::Integer, simTime::Real, flags::Uint16=0x0000)

    # println("sending end of frame")

    # write the RDB_MSG_HDR_t
    write(io, RDB_MAGIC_NO)
    write(io, RDB_VERSION)
    write(io, convert(Uint32, sizeof(RDB_MSG_HDR_t)))
    write(io, convert(Uint32, sizeof(RDB_MSG_ENTRY_HDR_t)))
    write(io, convert(Uint32, frameNo))
    write(io, convert(Cdouble, simTime))

    # write the RDB_MSG_ENTRY_HDR_t
    write(io, convert(Uint32, sizeof(RDB_MSG_ENTRY_HDR_t)))
    write(io, convert(Uint32, 0))
    write(io, convert(Uint32, 0))
    write(io, RDB_PKG_ID_END_OF_FRAME::Uint16)
    write(io, flags)
end
