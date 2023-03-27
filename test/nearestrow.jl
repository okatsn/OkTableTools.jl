@testset "nearestrow.jl" begin
    using DataFrames, Dates
    df = DataFrame(:a => 1:5, :b => 6:10, :c => 11:15)
    c = OkTableTools._selectcol(df, Cols(r"b", r"c", :a))
    @test isequal([nm for (nm, val) in pairs(c)], [:b, :c, :a])

    vals = [7.3, 1.9]
    colnms = [:b, :a]
    df1, id1 = sortbydist(df, Cols(colnms...), vals)
    df2, id2 = nearestrows(df, (colnms .=> vals)...; nrows = 5)
    @test isequal(DataFrame(df1), DataFrame(df2))
    @test isequal(id1, id2)
    @test isequal(first(id2), 2)

    row, id3 = nearestrow(df, :a, 2)
    @test id3 == 2

    # TODO: test DateTime
    # df = DataFrame(
    #     :t => DateTime(2013, 1, 1):DateTime(2013, 12, 31),
    #     :a => randn(365) .+ 50,
    #     :b => 5*randn(365) .- 20,
    #     :c => randn(365),
    # )

    # vals = [DateTime(2013,2,2), 1.0]
    # colnms = [:t, :a]
    # df1, id1 = sortbydist(df, Cols(colnms...), vals)
    # df2, id2 = nearestrows(df, (colnms .=> vals)...; nrows = 365)
    # @test isequal(DataFrame(df1), DataFrame(df2))


end
