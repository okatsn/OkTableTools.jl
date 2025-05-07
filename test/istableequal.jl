# src/test_istableequal.jl
using DataFrames

@testset "dataframes_equal tests" begin
    @testset "Identical DataFrames" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        df2 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        @test dataframes_equal(df1, df2) == true
    end

    @testset "Different column order" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        df2 = DataFrame(b=[4.0, 5.0, 6.0], a=[1, 2, 3])
        @test dataframes_equal(df1, df2) == true
    end

    @testset "NaN values" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, NaN, 6.0])
        df2 = DataFrame(a=[1, 2, 3], b=[4.0, NaN, 6.0])
        @test dataframes_equal(df1, df2) == true

        df3 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        @test dataframes_equal(df1, df3) == false
    end

    @testset "Missing values" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, missing, 6.0])
        df2 = DataFrame(a=[1, 2, 3], b=[4.0, missing, 6.0])
        @test dataframes_equal(df1, df2) == true

        df3 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        @test dataframes_equal(df1, df3) == false

        df4 = DataFrame(a=[1, 2, 3], b=[4.0, NaN, 6.0])
        @test dataframes_equal(df1, df4) == false
    end

    @testset "Nothing values" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, nothing, 6.0])
        df2 = DataFrame(a=[1, 2, 3], b=[4.0, nothing, 6.0])
        @test dataframes_equal(df1, df2) == true

        df3 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        @test dataframes_equal(df1, df3) == false

        df4 = DataFrame(a=[1, 2, 3], b=[4.0, NaN, 6.0])
        @test dataframes_equal(df1, df4) == false
    end

    @testset "Different number of rows" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        df2 = DataFrame(a=[1, 2], b=[4.0, 5.0])
        @test dataframes_equal(df1, df2) == false
    end

    @testset "Different column names" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        df2 = DataFrame(a=[1, 2, 3], c=[4.0, 5.0, 6.0])
        @test dataframes_equal(df1, df2) == false
    end

    @testset "Different data values" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        df2 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 7.0])
        @test dataframes_equal(df1, df2) == false
    end

    @testset "Different data values" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, missing])
        df2 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, nothing])
        @test dataframes_equal(df1, df2) == false
    end

    @testset "Different data values" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, missing])
        df2 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, NaN])
        @test dataframes_equal(df1, df2) == false
    end

    @testset "Different data values" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, NaN])
        df2 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, nothing])
        @test dataframes_equal(df1, df2) == false
    end

    @testset "Mixed types" begin
        df1 = DataFrame(a=[1, 2, 3], b=[4.0, 5.0, 6.0])
        df2 = DataFrame(a=[1, 2, 3], b=[4, 5, 6])
        # This should actually be true in Julia since 4.0 == 4
        @test dataframes_equal(df1, df2) == true

        df3 = DataFrame(a=[1, 2, 3], b=["4", "5", "6"])
        @test dataframes_equal(df1, df3) == false
    end

    @testset "Edge case with empty DataFrames" begin
        df1 = DataFrame(a=Int[], b=Float64[])
        df2 = DataFrame(a=Int[], b=Float64[])
        @test dataframes_equal(df1, df2) == true

        df3 = DataFrame(a=Int[])
        @test dataframes_equal(df1, df3) == false
    end
end
