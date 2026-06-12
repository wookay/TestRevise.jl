using Revise

using Test
using TestRevise: TestRevise, FAFO
@test_throws MethodError FAFO(1, 2)

filepath = normpath(pathof(TestRevise), "../types.jl")
open(filepath, "w") do f
    # Make sure we write 64bit integer in little-endian byte order
    write(f, """
# module TestRevise

struct FAFO
    field1
    field2
end

# module TestRevise
""")
end

const mtimedelay = 3.1
sleep(mtimedelay)

Revise.revise()

@test FAFO(1, 2) isa FAFO
