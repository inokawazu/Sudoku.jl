# Sudoku.jl
This is my implementation of sudoku in julia. The program solves Sudoku boards with a depth-first search algorithm.

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
