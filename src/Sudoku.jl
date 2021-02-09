module Sudoku

struct Board
	tiles::Array{Int64,2}
end

function Board(; state=:unknown)
	(state == :unknown) && Board(zeros(Int64, 9, 9))
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
	return (board.tiles[block_row-1:block_row+1,block_col-1:block_col+1])[:]
end

function is_valid(board::Board)

	for i∈1:9,k ∈ 1:9
			count(==(k),get_row(board,i)) > 1 && return false
	end

	for i∈1:9,k ∈ 1:9
			count(==(k),get_column(board,i)) > 1 && return false
	end

	for i∈2:3:8,j∈2:3:8,k ∈ 1:9
		count(==(k),get_block(board,i,j)) > 1 && return false
	end

	return true
end

function is_solved(board::Board)
	return 0 ∉ board.tiles
end

function set_element!(board::Board, row_num::Int64, col_num::Int64, element::Int64)
	board.tiles[row_num,col_num] = element 
end

function possible_moves(board::Board,row_num::Int64,col_num::Int64)
	element = get_element(board,row_num, col_num)

	element == 0 || return Int64[]

	return [i for i ∈ 1:9 if i∉get_row(board, row_num) 
													 && i∉get_column(board, col_num) 
													 && i∉get_block(board, row_num, col_num)]
end

function solve!(board::Board)
	index = 1
	backtrack_dict = Dict()

	unknown_tiles = [(j,i) for i∈1:9,j∈1:9 if get_element(board, i, j) == 0][:]

	while !is_solved(board) && index <= length(unknown_tiles)

		row, column = unknown_tiles[index]

		if !haskey(backtrack_dict, (row, column))
			push!(backtrack_dict, (row, column) => possible_moves(board, row, column))
		end

		if isempty(backtrack_dict[(row,column)])
			delete!(backtrack_dict, (row,column))
			set_element!(board,row, column, 0)
			index -= 1
			continue
		end

		next_move = popfirst!(backtrack_dict[(row, column)])
		set_element!(board, row, column, next_move)
		index += 1

	end
end

end # module
