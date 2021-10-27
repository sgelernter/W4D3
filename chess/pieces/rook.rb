# require_relative "slideable.rb"
require_relative "piece.rb"
require "byebug"

class Rook < Piece

    def initialize(color)
        super(color)
        @symbol = :R
    end

        # moves(prev_output)
        #     spaces, boart, pos = *prev_output

end
