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

end