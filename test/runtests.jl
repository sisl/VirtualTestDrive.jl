using Base.Test
using Lint

lintpkg("VirtualTestDrive")

using VirtualTestDrive
using LibExpat

reload("test_io.jl")
reload("test_virescsvs.jl")