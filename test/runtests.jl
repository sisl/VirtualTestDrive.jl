using Base.Test
using Lint

lintpkg("VirtualTestDrive")

using VirtualTestDrive
using LibExpat

include("test_io.jl")
include("test_virescsvs.jl")
