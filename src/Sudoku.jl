module Sudoku

struct Board
	tiles::Array{Int64,2}
end

function Board(; state=:unknown)
	state == :unknown && Board(zeros(Int64, 9, 9))
end



end # module
