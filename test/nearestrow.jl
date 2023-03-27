@testset "nearestrow.jl" begin
    df = DataFrame(:a => 1:5, :b => 6:10, :c => 11:15)
    c = OkTableTools._selectcol(df, Cols(r"b", r"c", :a))
    @test isequal([nm for (nm, val) in pairs(c)], [:b, :c, :a])


end
