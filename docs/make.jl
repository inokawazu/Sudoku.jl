using Documenter
using Sudoku

makedocs(
    sitename = "Sudoku",
    format = Documenter.HTML(),
    modules = [Sudoku]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
