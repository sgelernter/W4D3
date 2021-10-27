# require_relative "slideable.rb"
require_relative "piece.rb"
require "byebug"

class Rook < Piece
    include Slideable
    
    def initialize(color)
        super(color)
        @symbol = :R
    end

    def valid_spaces(current_board, position)
        spaces = super
        get_moves(spaces, position, current_board, HORIZONTAL_DIRS)
    end

end
