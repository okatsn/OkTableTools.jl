module OkTableTools

# Write your package code here.
using LinearAlgebra, DataFrames
using Dates
include("nearestrow.jl")
export nearestrow, nearestrows
export sortbydist
end
