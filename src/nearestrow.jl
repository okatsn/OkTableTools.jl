

function nearestrow(df::AbstractDataFrame, col, val)
    minval, id = findmin(abs.(df[!, col] .- val))
    return (df[id, :], id)
end

"""
`nearestrows` returns the `row::DataFrameRow` that best approaches the given columns and values as pairs.
That is, `nearestrows(df::AbstractDataFrame, prs::Pair...)` returns the row of `df` where the `norm` of the distances between column vectors and reference values in pair is minimum.

# Example
```julia
# to find the `row::DataFrameRow` where the `2`-`norm` of `row.time .- 2000` and  `row.friction .- 0.75` is minimum.
prs = "time" => 2000, "friction" => 0.75
```

"""
function nearestrows(df::AbstractDataFrame, prs::Pair...; nrows = 1)
    dist = [point for point in zip((val .- df[!, k] for (k, val) in prs)...)]
    # _, id = findmin(norm.(dist))
    ids = sortperm(norm.(dist))[1:nrows]
    rows = df[ids, :] |> eachrow
    return (rows, ids)
end# TODO: nearestid that returns id
# TODO: no tests yet
