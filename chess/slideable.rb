
module Slideable

    HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1, 1], [-1,-1]]

    def get_moves(moves, position, board, dir_set)
        final_moves = []
        dir_set.each do |step|
            comp_position = add_arrays(position.dup, step)
            until !moves.include?(comp_position) 
                if !board[comp_position].instance_of?(NullPiece)
                    final_moves << comp_position
                    break
                end
                final_moves << comp_position
                comp_position = add_arrays(comp_position, step)
            end
        end
        final_moves
    end

    def add_arrays(arr1, arr2)
        sum_arr = arr1.dup
        arr2.each_with_index {|el,i| sum_arr[i] += el}
        sum_arr
    end

end