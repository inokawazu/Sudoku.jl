# Sudoku.jl
This is my implementation of sudoku in julia. The program solves Sudoku boards with a depth-first search algorithm.

## Example

### For solving a generic Sudoku board (preferably one that has only one solution).

```julia
using Sudoku

solved_sudoku_board = solve("530070000600195000098000060800060003400803001700020006060000280000419005000080079")

println(solved_sudoku_board) 
# returns [5 3 4 6 7 8 9 1 2; 
#          6 7 2 1 9 5 3 4 8; 
#          1 9 8 3 4 2 5 6 7; 
#          8 5 9 7 6 1 4 2 3; 
#          4 2 6 8 5 3 7 9 1; 
#          7 1 3 9 2 4 8 5 6; 
#          9 6 1 5 3 7 2 8 4; 
#          2 8 7 4 1 9 6 3 5; 
#          3 4 5 2 8 6 1 7 9]
```

### For making a randomly solved Sudoku board.
```julia
using Sudoku

random_solved_sudoku_board = Board(;shuffle=true)

println(random_solved_sudoku_board.tiles)
```

## Installation

You can add this package with the following in your REPL.

```julia
import Pkg; Pkg.add("git@github.com:kawazugit/Sudoku.jl.git")
```

## Usage

### Making a board.
You can make a board with `Board`. A board has a tiles 9x9 array property where every element is a space on a sudoku board with that number. 0's are spaces that are unkown.  

First first way is to just call `Board()` which makes board with all 0's.

Second way with to give the board a 9 by 9 array of integers, `Board(9by9_array)`.

Third way is to call Board with a 81 length string of digit characters, `Board(81_len_string_of_digits)`.

#### Way to read the string.

The string of digits given to Board should be read row first left to rigtht.

ie 

`Board("530070000600195000098000060800060003400803001700020006060000280000419005000080079")` 

is the same as

```julia
Board([[5 3 0 0 7 0 0 0 0];
 [6 0 0 1 9 5 0 0 0];
 [0 9 8 0 0 0 0 6 0];
 [8 0 0 0 6 0 0 0 3];
 [4 0 0 8 0 3 0 0 1];
 [7 0 0 0 2 0 0 0 6];
 [0 6 0 0 0 0 2 8 0];
 [0 0 0 4 1 9 0 0 5];
 [0 0 0 0 8 0 0 7 9]])
```

## Solving Board

You can solve a board with `solve!` or `solve`

```julia
solve!(board) #Changes the board to a solved state.
```

```julia
solve(string) #Returns solved board starting with a Board(string).
```
