using Base.Test
using Lint

lintpkg("VirtualTestDrive")

using VirtualTestDrive
using LibExpat

helloworld = Uint8[0x68, 0x65, 0x6C, 0x6C, 0x6F, 0x20, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x00]
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("") == Uint8[0x00]
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("hello world") == helloworld
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("", 2) == Uint8[0x00, 0x00]
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("hello world", 4) == Uint8[0x68, 0x65, 0x6C, 0x00]
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("hello world", 14) == append!(helloworld, zeros(Uint8, 2))

@test VirtualTestDrive.string_from_buffer(helloworld) == "hello world"
@test VirtualTestDrive.string_from_buffer(
    VirtualTestDrive.string_to_zeroed_null_terminated_array("hi",10)
    ) == "hi"


e = ETree("Set")
e.attr["entity"] = "player"
push!(e.elements, ETree("Speed"))
e.elements[1].attr["value"] = "29.06"

f = VirtualTestDrive.message_payload_to_etree(
    "<Set entity=\"player\"><Speed value=\"29.06\"/></Set>")

@test f.name == e.name
@test f.attr == e.attr
@test f.elements[1].name == e.elements[1].name
@test f.elements[1].attr == e.elements[1].attr
@test length(f.elements) == length(e.elements)
@test f == e

@test VirtualTestDrive.message_contains_packet_with_element(
    e, "Set", "Speed")

@test isa(find_vtd_directory(false), String)