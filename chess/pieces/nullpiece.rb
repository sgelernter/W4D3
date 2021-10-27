require "singleton" 

class NullPiece < Piece

    include Singleton 

    def initialize
        super(:empty)
        @symbol = :_
    end

    
end