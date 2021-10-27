require_relative "piece.rb"
require "byebug"

class Pawn < Piece

    def initialize(color)
        super(color)
        @symbol = :P
        @color == :black ? @forward = 1 : @forward = -1
    end

    def valid_spaces(current_board, position)
        spaces = super
        row, col = position
        at_start = false
        at_start = true if row == 1 && @color == :black
        at_start = true if row == 6 && @color == :white

        one_step = [[row + @forward, col]]
        two_steps = [[row + 2*@forward, col]]
        unless at_start
            return one_step & spaces
        else
            return (one_step + two_steps) & spaces
        end
    end

end