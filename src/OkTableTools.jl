module OkTableTools

# Write your package code here.
using LinearAlgebra, DataFrames
using Dates
include("nearestrow.jl")
export nearestrow, nearestrows
export sortbydist

include("istableequal.jl")
export dataframes_equal
end
