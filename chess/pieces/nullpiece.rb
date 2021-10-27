require "singleton" 
require_relative "piece.rb"

class NullPiece < Piece

    include Singleton 

    def initialize
        super(:default)
        @symbol = " "
    end

    
end