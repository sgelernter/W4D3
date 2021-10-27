require_relative "piece.rb"
require "byebug"

class Bishop < Piece
    include Slideable
    
    def initialize(color)
        super(color)
        @symbol = :B
    end

    def valid_spaces(current_board, position)
        spaces = super
        get_moves(spaces, position, current_board, DIAGONAL_DIRS)
    end

end