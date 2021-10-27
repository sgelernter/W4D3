require_relative "piece.rb"
require "byebug"

class Knight < Piece

    include Steppable
    
    KNIGHT_DIRS = [[2,1], [2,-1], [-2, 1], [-2,-1], [1,2], [-1,2], [-1,-2], [1,-2]]

    def initialize(color)
        super(color)
        @symbol = :Kn
    end

    def valid_spaces(current_board, position)
        spaces = super
        get_moves(spaces, position, KNIGHT_DIRS)
    end

end