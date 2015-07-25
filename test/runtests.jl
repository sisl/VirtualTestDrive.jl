using VirtualTestDrive
using Base.Test

helloworld = Uint8[0x68, 0x65, 0x6C, 0x6C, 0x6F, 0x20, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x00]
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("") == Uint8[0x00]
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("hello world") == helloworld
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("", 2) == Uint8[0x00, 0x00]
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("hello world", 4) == [helloworld[1:3], 0x00]
@test VirtualTestDrive.string_to_zeroed_null_terminated_array("hello world", 14) == [helloworld, zeros(Uint8, 2)]

@test VirtualTestDrive.string_from_buffer(helloworld) == "hello world"
@test VirtualTestDrive.string_from_buffer(
    VirtualTestDrive.string_to_zeroed_null_terminated_array("hi",10)
    ) == "hi"


