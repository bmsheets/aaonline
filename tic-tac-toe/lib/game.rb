require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :current_player, :player1, :player2

    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      player1.mark = :X
      player2.mark = :O
      @board = Board.new
      @current_player = player1
    end

    def switch_players!
      if current_player == player1
        self.current_player = player2
      else
        self.current_player = player1
      end
    end

    def play_turn
      board.place_mark(current_player.get_move, current_player.mark)
      switch_players!
      current_player.display(board)
    end

    def play
      current_player.display(board)

      until board.over?
        play_turn
      end

      if game_winner
        puts "#{game_winner.name} wins!"
      else
        puts "Tie game."
      end
    end

    def game_winner
      return player1 if board.winner == player1.mark
      return player2 if board.winner == player2.mark
      nil
    end
end

=begin
puts "Enter your name."
player_name = gets.chomp
human = HumanPlayer.new(player_name)
computer = ComputerPlayer.new("Computer")
game = Game.new(human, computer)
game.play
=end
