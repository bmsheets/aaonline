class HumanPlayer
    attr_reader :name
    attr_accessor :mark

    def initialize(name)
        #@mark = mark
        @name = name
    end

    def display(board)
        grid = board.grid
        puts "  #{grid[0][2]} | #{grid[1][2]} | #{grid[2][2]}"
        puts " ---------"
        puts "  #{grid[0][1]} | #{grid[1][1]} | #{grid[2][1]}"
        puts " ---------"
        puts "  #{grid[0][0]} | #{grid[1][0]} | #{grid[2][0]}"
    end

    def get_move
        puts "Where would you like to move?"
        input = gets.chomp.chars
        move = [input.first.to_i, input.last.to_i]
    end
end
