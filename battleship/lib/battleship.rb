class BattleshipGame
  attr_reader :board, :player

    def initialize(board = Board.new(), player = HumanPlayer.new("Player"))
        @player = player
        @board = board
        @hit = false
    end

    def play
        until game_over?
            play_turn
        end
    end

    def play_turn
        pos = player.get_play
        attack(pos)
    end

    def attack(pos)
        if board[pos] == :s
            hit = true
        else
            hit = false
        end
        board[pos] = :x 
    end

    def display_status
    end

    def count
        board.count
    end

    def game_over?
        board.won?
    end

    #game = BattleshipGame.new
    #game.play
end
