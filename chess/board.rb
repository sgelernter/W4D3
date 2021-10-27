require "byebug"
# require_relative "piece.rb"
require_relative "./pieces/nullpiece.rb"
require_relative "./pieces/rook.rb"
require_relative "./pieces/pawn.rb"
require_relative "./pieces/bishop.rb"
require_relative "./pieces/king.rb"
require_relative "./pieces/knight.rb"
require_relative "./pieces/queen.rb"

class Board

    attr_reader :grid

    START_PLACES = {Rook => [[0,0], [0,7], [7,0], [7,7]],
                    Knight=> [[0,1], [0,6], [7,1], [7,6]],
                    Bishop=> [[0,2], [0,5], [7,2], [7,5]],
                    Queen=> [[0,3], [7,3]],
                    King=> [[0,4], [7,4]]
                }

    def initialize 
        @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
        (0..7).each do |col| #black at top, white at bottom
            @grid[1][col] = Pawn.new(:black)
            @grid[6][col] = Pawn.new(:white)
        end
        START_PLACES.keys.each do |piece|
            START_PLACES[piece].each do |pos|
                row, col = pos
                row == 0 ? @grid[row][col] = piece.new(:black) : @grid[row][col] = piece.new(:white)
            end
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end 
    
    def render
        (0..7).each do |row|
            (0..7).each do |col|
               print  "#{@grid[row][col].symbol}  "
            end
            puts
        end
    end

    def move_piece(start_pos, end_pos)
        raise "Please choose a spot with a piece!" if self[start_pos].instance_of?(NullPiece)
        raise "That piece can't go there!" if !self[start_pos].valid_spaces(self, start_pos).include?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
        self
    end
end

b = Board.new
b.render
# puts
# b.move_piece([1,2], [2,3])
# b.render
