"""
`dataframes_equal(df1, df2)`

Compare two DataFrames element by element to determine if they are equal.

This function performs a detailed comparison between two DataFrames by:
1. Checking if they have the same number of rows
2. Verifying that they have identical column names
3. Comparing each element in corresponding positions

Special handling is implemented for:
- `NaN` values (considered equal to other `NaN`s)
- `missing` values (considered equal to other `missing`s)

# Arguments
- `df1::DataFrame`: First DataFrame to compare
- `df2::DataFrame`: Second DataFrame to compare

# Returns
- `Bool`: `true` if DataFrames are equal, `false` otherwise

# Limitations
- Returns `false` for columns containing mutable elements (e.g., vectors)
- Column order is not considered (only content is compared)

# Examples
```julia
df1 = DataFrame(a = [1, 2], b = [3.0, NaN])
df2 = DataFrame(b = [3.0, NaN], a = [1, 2])
dataframes_equal(df1, df2)  # returns true
```
"""
function dataframes_equal(df1, df2)
    # Check that column names and number of rows are the same
    if nrow(df1) != nrow(df2)
        @warn "Number of rows is not equal."
        return false
    end

    if Set(names(df1)) != Set(names(df2))
        @warn "Number of columns or one or more column names is not equal."
        return false
    end

    # Compare each element in each column
    for col in names(df1)
        for i in 1:nrow(df1)
            v1 = df1[i, col]
            v2 = df2[i, col]

            if ismissing(v1) || ismissing(v2)
                return ismissing(v1) && ismissing(v2)
            end

            if v1 != v2 # if either is missing, error returned.
                if isnan(v1) && isnan(v2)
                    # pass
                else
                    @warn "At column $col of row $i, the element is not equal ($v1 != $v2)"
                    return false
                end
            end
        end
    end
    return true
end
