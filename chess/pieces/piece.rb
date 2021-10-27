require_relative "steppable.rb"
require_relative "slideable.rb"
require "byebug"

class Piece

    attr_reader :symbol, :color

    def initialize(color)
        @color = color
        @symbol = :piece
    end

    def valid_spaces(current_board, position)
        spaces = []
        (0..7).each do |row|            
            (0..7).each do |col| 
                if current_board[[row,col]].color != self.color
                    spaces << [row,col] 
                end
            end
        end
        spaces
        # get_moves(spaces, position, [[0, 1], [1, 1], [1,0], [-1, 1], [-1, -1], [-1, 0], [0, -1], [1, -1]])
    end

    def inspect
        @symbol.inspect
    end

    def add_arrays(arr1, arr2)
        sum_arr = arr1.dup
        arr2.each_with_index {|el,i| sum_arr[i] += el}
        sum_arr
    end

    def to_s
        " #{@symbol.to_s} "
    end
    
end