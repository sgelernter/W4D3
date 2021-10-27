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

    def initialize 
        @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
        (0..7).each do |col| #black at top, white at bottom
            @grid[1][col] = Pawn.new(:black)
            @grid[6][col] = Pawn.new(:white)
            # (0..7).each do |col|
                # if row < 2 || row > 5
                    #what's the position ==> ask pieces if any of them start there, if so initialize that piece there
                    # @grid[row][col] = Pawn.new(:black)
                end
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
puts
b.move_piece([1,2], [2,3])
b.render
