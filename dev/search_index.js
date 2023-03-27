var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = OkTableTools","category":"page"},{"location":"#OkTableTools","page":"Home","title":"OkTableTools","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for OkTableTools.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [OkTableTools]","category":"page"},{"location":"#OkTableTools.nearestrows-Tuple{DataFrames.AbstractDataFrame, Vararg{Pair}}","page":"Home","title":"OkTableTools.nearestrows","text":"nearestrows returns the row::DataFrameRow that best approaches the given columns and values as pairs. That is, nearestrows(df::AbstractDataFrame, prs::Pair...) returns the row of df where the norm of the distances between column vectors and reference values in pair is minimum.\n\nExample\n\n# to find the `row::DataFrameRow` where the `2`-`norm` of `row.time .- 2000` and  `row.friction .- 0.75` is minimum.\nprs = \"time\" => 2000, \"friction\" => 0.75\n\n\n\n\n\n","category":"method"}]
}