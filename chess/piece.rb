require_relative "steppable.rb"
require "byebug"

class Piece
    include Steppable

    attr_reader :symbol, :color

    def initialize(color)
        @color = color
        @symbol = :piece
    end

    def valid_moves(current_board, position)
        moves = []
        (0..7).each do |row|            
            (0..7).each do |col| 
                if current_board[[row,col]].color != self.color
                    moves << [row,col] 
                end
            end
        end
        moves
        # get_moves(moves, position, [[0, 1], [1, 1], [1,0], [-1, 1], [-1, -1], [-1, 0], [0, -1], [1, -1]])
    end

    def inspect
        @symbol.inspect
    end
end