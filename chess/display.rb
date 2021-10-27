require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
    
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def get_grid
        fun_grid = Array.new(8) {Array.new(8)}
        (0..7).each do |row|
            (0..7).each do |col|
               color_options = colors(row, col)
               fun_grid[row][col] = @board[[row, col]].to_s.colorize(color_options)
            end
        end
        fun_grid
        fun_grid.each {|row| puts row.join }
    end


    def colors(row, col)
        if @cursor.cursor_pos == [row, col]
            bg = :light_cyan
        elsif (row + col).odd? 
            bg = :light_blue
        else
            bg = :light_magenta
        end
        { background: bg, color: @board[[row, col]].color }
    end
 
end

disp = Display.new(Board.new)
disp.get_grid