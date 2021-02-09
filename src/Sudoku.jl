module Sudoku

struct Board
	tiles::Array{Int64,2}
end

function Board(; state=:unknown)
	state == :unknown && Board(zeros(Int64, 9, 9))
end

function get_element(board::Board, row_num::Int64,col_num::Int64)
	return board.tiles[row_num,col_num]
end

function get_row(board::Board, row_num::Int64)
	return board.tiles[row_num,:]
end

function get_column(board::Board, col_num::Int64)
	return board.tiles[:,col_num]
end

to_block_index(index::Int64) = index + 1 - ((index - 1) % 3)

function get_block(board::Board, row_num::Int64,col_num::Int64)
	block_row = to_block_index(row_num)
	block_col = to_block_index(col_num)
	return board.tiles[block_row-1:block_row+1,block_col-1:block_col+1]
end

function is_valid(board::Board)
	error("TBD")
end

function is_solved(board::Board)
	error("TBD")
end

function set_element!(board::Board, row_num::Int64, col_num::Int64, element::Int64)
	board.tiles[row_num,col_num] = element 
end

function possible_moves(board::Board,row_num::Int64,col_num::Int64)
	element = get_element(board,row_num, col_num)

	pos_moves = Int64[]

	element == 0 && return pos_moves

	return [i for i ∈ 1:9 if i∉get_row(board, row_num) 
													 && i∉get_column(board, col_num) 
													 && i∉get_block(board, row_num, col_num)]
end

function solve!(board::Board)
	for row ∈ 1:9
		for column ∈ 1:9
			
			moves = possible_moves(board, row, column)

			isempty(moves) && continue

			is_solved(board) && continue

			for move in moves
				set_element!(board, row, column, move)

				is_solved(board) && break
			end
#		for pos_move ∈ possible_moves(board, row, column)

		end
	end
end

end # module
