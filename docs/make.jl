using OkTableTools
using Documenter

DocMeta.setdocmeta!(OkTableTools, :DocTestSetup, :(using OkTableTools); recursive=true)

makedocs(;
    modules=[OkTableTools],
    authors="okatsn <okatsn@gmail.com> and contributors",
    repo="https://github.com/okatsn/OkTableTools.jl/blob/{commit}{path}#{line}",
    sitename="OkTableTools.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://okatsn.github.io/OkTableTools.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/okatsn/OkTableTools.jl",
    devbranch="main",
)
