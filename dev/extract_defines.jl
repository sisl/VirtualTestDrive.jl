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

            if ismatch(r"\[\d+\]\Z", name) # is an array type
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
function print_read(io::IO, struct::Struct)

    #=
    function Base.read(io, ::Type{RDB_MSG_ENTRY_HDR_t})
        headerSize = read(io, Uint32)
        dataSize = read(io, Uint32)
        elementSize = read(io, Uint32)
        pkgId = read(io, Uint16)
        flags = read(io, Uint16)
        RDB_MSG_ENTRY_HDR_t(headerSize, dataSize, elementSize, pkgId, flags)
    end
    =#

    println(io, "function Base.read(io::IO, ::Type{", struct.name, "})")
    for entry in struct.entries
        println(io, "\t", entry.name, " = read(io, ", entry.jtype, ")")
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
        println(io, "\tstruct.", entry.name, " = read(io, ", entry.jtype, ")")
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
        @printf(io, "\tsimTime:    %.16e", struct.simTime)
    end
    =#

    println(io, "function Base.show(io::IO, struct::", struct.name, ")")
    println(io, "\tprintln(io, \"", struct.name, ":\")")


    max_name_length = isempty(struct.entries) ? 0 : maximum(map(e->length(e.name), struct.entries))

    for entry in struct.entries
        name = entry.name
        spacing = max_name_length + 1 - length(name)
        print(io, "\tprintln(io, \"\t", name, ":", " "^spacing)
        if ismatch(r"Uint", entry.jtype)
            println(io, "%s\", hex(struct.", entry.name, "))")
        elseif ismatch(r"(Int|Cint)", entry.jtype)
            println(io, "%d\",struct.", entry.name, ")")
        elseif ismatch(r"(Cfloat|Cdouble)", entry.jtype)
            println(io, "%.16e\",struct.", entry.name, ")")
        else
            println(io, entry.jtype, "\")")
        end
    end
    println(io, "end")
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
end