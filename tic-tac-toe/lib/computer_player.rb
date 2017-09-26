class ComputerPlayer
    attr_reader :name, :board
    attr_accessor :mark

    def initialize(name)
        @name = name
    end

    def display(board)
        @board = board
    end

    def get_move
        move = get_winning_move
        move = get_random_move if move == nil
        move
    end

    private

    def get_winning_move
        all_possible_moves.each do |move|
           return move if winning_move?(move)
        end
        nil
    end

    def winning_move?(move)
      board.place_mark(move, mark)
      if board.winner == mark
        board.remove_mark(move)
        return true
      else
        board.remove_mark(move)
        return false
      end
    end

    def get_random_move
        all_possible_moves.sample
    end

    def all_possible_moves
        moves = []
        all_positions.each do |position|
            moves << position if board.empty?(position)
        end
        moves
    end

    def all_positions
        positions = []
        (0..2).each do |x|
            (0..2).each do |y|
                positions << [x, y]
            end
        end
        positions
    end
end
