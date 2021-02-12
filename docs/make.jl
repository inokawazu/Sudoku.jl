using Documenter
using Sudoku

makedocs(
    sitename = "Sudoku",
    format = Documenter.HTML(),
    modules = [Sudoku]
)

push!(LOAD_PATH,"../src/")

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
