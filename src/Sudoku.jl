module Sudoku

struct Board
	tiles::Array{Int64,2}
end

function Board(; state=:unknown)
	state == :unknown && Board(zeros(Int64, 9, 9))
end

function get_row(board::Board, row_num::Int64)
	error("TBD")
end

function get_column(board::Board, col_num::Int64)
	error("TBD")
end

function get_block(board::Board, block_num::Int64)
	error("TBD")
end

function is_valid(board::Board)
	error("TBD")
end

function set_element!(board::Board,row_num::Int64,col_num::Int64)
	error("TBD")
end

function possible_moves(board::Board,row_num::Int64,col_num::Int64)
	error("TBD")
end

end # module
