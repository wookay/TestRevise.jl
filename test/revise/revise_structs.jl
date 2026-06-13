module test_revise_structs

using Test
using Revise

using TestRevise: TestRevise, FAFO

@test FAFO(3) isa FAFO
@test_throws MethodError FAFO(1, 2)

filepath = normpath(pathof(TestRevise), "../types.jl")
open(filepath, "w") do f
    write(f, """
# module TestRevise

struct FAFO
    field1
    field2
end

# module TestRevise
""")
end

const mtimedelay = 0.1
sleep(mtimedelay)

Revise.revise()

@test_throws MethodError FAFO(3)
@test FAFO(1, 2) isa FAFO

open(filepath, "w") do f
    write(f, """
# module TestRevise

struct FAFO
    field1
end

# module TestRevise
""")
end

sleep(mtimedelay)

Revise.revise()

@test FAFO(3) isa FAFO
@test_throws MethodError FAFO(1, 2)

end # module test_revise_structs
