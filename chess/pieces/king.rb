require_relative "piece.rb"
require "byebug"

class King < Piece

    include Steppable
    
    KING_DIRS = [[1,1], [1,-1], [-1, 1], [-1,-1], [0,1], [0,-1], [1,0], [-1,0]]

    def initialize(color)
        super(color)
        @symbol = "\u2654"
    end

    def valid_spaces(current_board, position)
        spaces = super
        get_moves(spaces, position, KING_DIRS)
    end

end