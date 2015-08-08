#=
Loads the given file and finds all defined constants and struct defs
and prints them out in a julia format.

eg: 

#define RDB_DYN_2_STEER_CMD_NONE 0x0000
→
const RDB_DYN_2_STEET_CMD_NONE @compat UInt32(0x0000)

typedef struct
{
    double x;
    double y;
    double z;   
    uint8_t  flags;
    uint8_t  type;  
    uint16_t system;
} RDB_POINT_t;
→
type RDB_POINT_t
    x::Cdouble
    y::Cdouble
    z::Cdouble
    flags::Uint8
    type::Uint8
    system::Uint16
end

=#

const FILEPATH = "/home/tim/VTD.1.4/Develop/Framework/inc/viRDBIcd.h"
const CTYPE_TO_JULIA = [
        "uint8_t" => "Uint8",
        "uint16_t" => "Uint16",
        "uint32_t" => "Uint32",
        "uint64_t" => "Uint64",
        "int8_t" => "Int8",
        "int16_t" => "Int16",
        "int32_t" => "Int32",
        "int64_t" => "Int64",
        "int" => "Cint",
        "float" => "Cfloat",
        "double" => "Cdouble",
    ]
const JTYPE_TO_SIZE = [
        "Uint8" => sizeof(Uint8),
        "Uint16" => sizeof(Uint16),
        "Uint32" => sizeof(Uint32),
        "Uint64" => sizeof(Uint64),
        "Int8" => sizeof(Int8),
        "Int16" => sizeof(Int16),
        "Int32" => sizeof(Int32),
        "Int64" => sizeof(Int64),
        "Cint" => sizeof(Cint),
        "Cfloat" => sizeof(Cfloat),
        "Cdouble" => sizeof(Cdouble),
        "RDB_COORD_t" => 44,
    ]
const RESERVED_NAMES = [
        "type" => "thetype",
    ]

# type Define
#     name::String
#     value::Any
# end
type StructEntry
    name::String
    ctype::String
    jtype::String
    array_length::Int # if 0, not an array, otherwise the length
end
type Struct
    name::String
    entries::Vector{StructEntry}
end

matches_define(line::String) = match(r"#define \w+\s+(\dx\d+|\d+)", line)
# function parse_define(m::RegexMatch)

#     name = match(r"(?<=#define )\w+", m.match).match
#     value = match(r"(0x\d+|\d+)\Z", m.match).match

#     if ismatch(r"0x\d+", value) # hex value
#         nbytes = div(length(value)-2, 2)
#         @assert(nbytes > 0)

#         nbits = nbytes > 2 && mod(nbytes,2)==1 ? 8*(nbytes+1) : 8*nbytes
#         Define(name, )
#         # println("const ", name, " = @compat UInt", string(nbits), "(", value, ")")

#     else # base 10 value
#         # println("const ", name, " = convert(Cint, ", value, ")")
#         Define()
#     else
#         Define()
#     end

# end
# parse_define(line::String) = parse_define(matches_define(line))

matches_struct(line::String) = match(r"typedef struct", line)
function parse_struct{S<:String}(lines::Vector{S}, startlineindex::Int)

    endindex = 0
    for j = startlineindex+1:length(lines)
        if ismatch(r"\A} \w+;", lines[j])
            endindex = j
            break
        end
    end
    @assert(endindex != 0)

    name = match(r"(?<=\A} )\w+", lines[endindex]).match
    struct = Struct(name, StructEntry[])

    for j in startlineindex+1 : endindex-1
        m = match(r"\w*\s+\w+(\[\d+\])?(?=;)", lines[j])
        if isa(m, RegexMatch)
            name = match(r"\s\w+", m.match).match[2:end]
            name = get(RESERVED_NAMES, name, name)
            ctype = match(r"\w+", m.match).match
            jtype = get(CTYPE_TO_JULIA, ctype, ctype)
            array_length = 0

            if ismatch(r"\[\d+\]\Z", m.match) # is an array type
                array_length = int(match(r"(?<=\[)\d+(?=\])", m.match).match)
            end

            push!(struct.entries, StructEntry(name, ctype, jtype, array_length))
        end
    end

    struct
end
function Base.print(io::IO, entry::StructEntry)
    len = entry.array_length
    jtype = entry.jtype

    if len > 0
        print(entry.name, "::(", (jtype * ", ")^(len-1)*jtype, ")")
    else
        print( entry.name, "::", jtype)
    end
end
function Base.print(io::IO, struct::Struct)
    println(io, "type ", struct.name)
    for entry in struct.entries
        println(io, "\t", entry)
    end
    println("end")
end
function contains_tuple(struct::Struct)
    for entry in struct.entries
        if entry.array_length > 0
            return true
        end
    end
    return false
end
function print_read(io::IO, struct::Struct)

    #=
    function Base.read(io, ::Type{RDB_MSG_ENTRY_HDR_t})
        headerSize = read(io, Uint32)
        dataSize = read(io, Uint32)
        elementSize = read(io, Uint32)
        pkgId = read(io, Uint16)
        flags = read(io, Uint16)
        spare0 = (read(io, Uint8), read(io, Uint8))
        RDB_MSG_ENTRY_HDR_t(headerSize, dataSize, elementSize, pkgId, flags)
    end
    =#

    println(io, "function Base.read(io::IO, ::Type{", struct.name, "})")
    for entry in struct.entries
        if entry.array_length == 0
            println(io, "\t", entry.name, " = read(io, ", entry.jtype, ")")
        else
            print(io, "\t", entry.name, " = (")
            for i = 1 : entry.array_length
                if i > 1
                    print(io, ", ")
                end
                print(io, "read(io, ", entry.jtype, ")")
            end
            println(io, ")")
        end
    end
    print(io, "\t", struct.name, "(")
    for (i,entry) in enumerate(struct.entries)
        if i > 1
            print(io, ", ")
        end
        print(io, entry.name)
    end
    println(io, ")")
    println(io, "end")
end
function print_read!(io::IO, struct::Struct)

    #=
    function Base.read!(io, struct::RDB_MSG_ENTRY_HDR_t)
        struct.headerSize = read(io, Uint32)
        struct.dataSize = read(io, Uint32)
        struct.elementSize = read(io, Uint32)
        struct.pkgId = read(io, Uint16)
        struct.flags = read(io, Uint16)
        struct
    end
    =#

    println(io, "function Base.read!(io::IO, struct::", struct.name, ")")
    for entry in struct.entries
        if entry.array_length == 0
            println(io, "\tstruct.", entry.name, " = read(io, ", entry.jtype, ")")
        else
            print(io, "\tstruct.", entry.name, " = (")
            for i = 1 : entry.array_length
                if i > 1
                    print(io, ", ")
                end
                print(io, "read(io, ", entry.jtype, ")")
            end
            println(io, ")")
        end
    end
    println(io, "\tstruct")
    println(io, "end")
end
function print_write(io::IO, struct::Struct)

    #=
    function Base.write(io::IO, header::RDB_MSG_ENTRY_HDR_t)
        write(io, header.headerSize)
        write(io, header.dataSize)
        write(io, header.elementSize)
        write(io, header.pkgId)
        write(io, header.flags)
    end
    =#

    println(io, "function Base.write(io::IO, struct::", struct.name, ")")
    for entry in struct.entries
        println(io, "\twrite(io, struct.", entry.name, ")")
    end
    println(io, "end")
end
function print_show(io::IO, struct::Struct)
    #=
    function Base.show(io::IO, struct::RDB_MSG_HDR_t)
        println(io, "RDB_MSG_HDR_t:")
        println(io, "\tmagicNo:    %s", hex(struct.magicNo))
        println(io, "\tversion:    %s", hex(struct.version))
        println(io, "\theaderSize: %d", struct.headerSize)
        println(io, "\tdataSize:   %d", struct.dataSize)
        println(io, "\tframeNo:    %d", struct.frameNo)
        @printf(io, "\tsimTime:    %+.16e", struct.simTime)
    end
    =#

    println(io, "function Base.show(io::IO, struct::", struct.name, ")")
    println(io, "\tprintln(io, \"", struct.name, ":\")")


    max_name_length = isempty(struct.entries) ? 0 : maximum(map(e->length(e.name), struct.entries))

    for entry in struct.entries
        name = entry.name
        spacing = max_name_length + 1 - length(name)
        print(io, "\t@printf(io, \"\t", name, ":", " "^spacing)
        if ismatch(r"Uint", entry.jtype) || entry.array_length > 0
            println(io, "%s\\n\", hex(struct.", entry.name, "))")
        elseif ismatch(r"(Int|Cint)", entry.jtype)
            println(io, "%d\\n\",struct.", entry.name, ")")
        elseif ismatch(r"(Cfloat|Cdouble)", entry.jtype)
            println(io, "%+.16e\\n\",struct.", entry.name, ")")
        else
            println(io, entry.jtype, "\\n\")")
        end
    end
    println(io, "end")
end
function print_sizeof(io::IO, struct::Struct)
    #=
    Base.sizeof(::RDB_MSG_HDR_t) = 24
    Base.sizeof(::Type{RDB_MSG_HDR_t}) = 24

    NOTE: this fails if it contains non-standard Ctypes
          e.g. other header entry types
    =#

    nbytes = 0
    for entry in struct.entries
        typesize = JTYPE_TO_SIZE[entry.jtype]
        if entry.array_length == 0    
            nbytes += typesize
        else
            nbytes += typesize*entry.array_length
        end
    end

    println(io, "Base.sizeof(::", struct.name, ") = ", nbytes)
    println(io, "Base.sizeof(::Type{", struct.name, "}) = ", nbytes)
end

lines = open(fh->readlines(fh), FILEPATH)

structs = Struct[]

for i = 1 : length(lines)
    m = matches_define(lines[i])
    if isa(m, RegexMatch)
        name = match(r"(?<=#define )\w+", m.match).match
        value = match(r"(0x\d+|\d+)\Z", m.match).match

        if ismatch(r"0x\d+", value) # hex value
            nbytes = div(length(value)-2, 2)
            @assert(nbytes > 0)

            nbits = nbytes > 2 && mod(nbytes,2)==1 ? 8*(nbytes+1) : 8*nbytes
            println("const ", name, " = @compat UInt", string(nbits), "(", value, ")")

        else # base 10 value
            println("const ", name, " = convert(Cint, ", value, ")")
        end
    else
        m = matches_struct(lines[i])
        if isa(m, RegexMatch)
            push!(structs, parse_struct(lines, i))
        end
    end
end

# export structs
for struct in structs
    println("")
    println(struct)
end
for struct in structs
    println("")
    print_read(STDOUT, struct)
    print_read!(STDOUT, struct)
    print_write(STDOUT, struct)
    print_show(STDOUT, struct)
    !contains_tuple(struct) || print_sizeof(STDOUT, struct)
end