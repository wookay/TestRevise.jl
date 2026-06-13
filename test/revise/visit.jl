module test_revise_visit

using Test
using Revise

Revise.is_typeeq
Revise.typeeq_parameter

typlike = Type{Vector}

if VERSION >= v"1.14.0-DEV.2291" # julia commit 26145852c4
Base.isType
Base.type_parameter

@test Revise.is_typeeq(typlike)
@test Revise.typeeq_parameter(typlike) === Vector
else
@test Revise.is_typeeq(typlike) === false
@test_throws FieldError Revise.typeeq_parameter(typlike)
end # if

end # module test_revise_visit
