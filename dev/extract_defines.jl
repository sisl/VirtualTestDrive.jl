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

lines = open(fh->readlines(fh), FILEPATH)

for i = 1 : length(lines)
    m = match(r"#define \w+\s+(\dx\d+|\d+)", lines[i])
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
        m = match(r"typedef struct", lines[i])
        if isa(m, RegexMatch)
            endindex = 0
            for j = i+1:length(lines)
                if ismatch(r"\A} \w+;", lines[j])
                    endindex = j
                    break
                end
            end
            @assert(endindex != 0)

            name = match(r"(?<=\A} )\w+", lines[endindex]).match

            println("type ", name)
            for j in i+1 : endindex-1
                m = match(r"\w*\s+\w+(\[\d+\])?(?=;)", lines[j])
                if isa(m, RegexMatch)
                    
                    ctype = match(r"\w+", m.match).match
                    name = match(r"\s\w+", m.match).match[2:end]
                    jtype = get(CTYPE_TO_JULIA, ctype, ctype)
                    name = get(RESERVED_NAMES, name, name)

                    if ismatch(r"\[\d+\]\Z", m.match)
                        # is an array type
                        len = int(match(r"(?<=\[)\d+(?=\])", m.match).match)
                        println("\t", name, "::(", (jtype * ", ")^(len-1)*jtype, ")")
                    else
                        
                        println("\t", name, "::", jtype)
                    end
                end
            end
            println("end")
            println("")
        end
    end
end