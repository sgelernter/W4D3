require "byebug"
# require_relative "piece.rb"
require_relative "./pieces/nullpiece.rb"
require_relative "./pieces/rook.rb"

class Board
    attr_reader :grid
    def initialize 
        @grid = Array.new(8) {Array.new(8)}
        (0..7).each do |row|
            (0..7).each do |col|
                if row < 2 || row > 5
                    #what's the position ==> ask pieces if any of them start there, if so initialize that piece there
                    @grid[row][col] = Rook.new(:white)
                else
                    @grid[row][col] = NullPiece.instance
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
b.move_piece([1,3], [2,4])
b.render

# p b[[3,3]].valid_moves(b, [3,3])
# p b.move_piece([0,0], [3,0])
# p b.move_piece([3,0], [7,7])
# p b.move_piece([7,7], [8,9])
# p b.move_piece([4,7], [3,3])