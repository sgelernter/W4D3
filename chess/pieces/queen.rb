require_relative "piece.rb"
require "byebug"

class Queen < Piece
    include Slideable

    ALL_DIRS = HORIZONTAL_DIRS + DIAGONAL_DIRS
    
    def initialize(color)
        super(color)
        @symbol = :Q
    end

    def valid_spaces(current_board, position)
        spaces = super
        get_moves(spaces, position, current_board, ALL_DIRS)
    end

end
