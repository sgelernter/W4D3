require "byebug"

module Steppable


    def get_moves(moves, position, dir_set)
        final_moves = []
        dir_set.each do |step|
            pos = add_arrays(position, step)
            final_moves << pos if moves.include?(pos)
        end
        final_moves
    end


    def add_arrays(arr1, arr2)
        sum_arr = arr1.dup
        arr2.each_with_index {|el,i| sum_arr[i] += el}
        sum_arr
    end

end