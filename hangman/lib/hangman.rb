class Hangman
  attr_reader :guesser, :referee, :board

    def initialize(players)
        @guesser = players[:guesser]
        @referee = players[:referee]
    end

    def setup
        secret_length = referee.pick_secret_word
        guesser.register_secret_length(secret_length)
        @board = Array.new(secret_length)
    end
        
    def take_turn
        guess = @guesser.guess(@board)
        indicies = @referee.check_guess(guess)
        update_board(guess, indicies)
        @guesser.handle_response(guess, indicies)
    end

    def update_board(guess, indicies)
        indicies.each {|idx| @board[idx] = guess}
    end
end

class HumanPlayer
    def pick_secret_word
    end

    def register_secret_length
    end

    def guess(board)
    end

    def check_guess(guess)
    end

    def handle_response(guess, indicies)
    end
end

class ComputerPlayer
    
    attr_reader :candidate_words

    def initialize(dictionary)
        @dictionary = dictionary
    end

    def pick_secret_word
        @secret_word = @dictionary.sample
        @secret_word.length
    end

    def register_secret_length(secret_length)
       @candidate_words = @dictionary.select {|word| word.length == secret_length} 
    end

    def guess(board)
        freq_table = freq_table(board)
        sorted_letters = freq_table.keys.sort_by {|letter, count| count}
        letter, _ = sorted_letters.last
        letter
    end

    def check_guess(guess)
        #raise "Error: Invalid input" if !letter.is_a(String)
        indicies = []
        @secret_word.chars.each_with_index do |char, i|
            indicies << i if guess == char
        end
        indicies
    end

    def handle_response(guess, indicies)
        @candidate_words.reject! do |word|
            remove = false
            word.split("").each_with_index do |char, index|
                if char == guess && !indicies.include?(index)
                    remove = true
                elsif char != guess && indicies.include?(index)
                    remove = true
                end
            end 
            remove
        end
    end

    def freq_table(board)
        freq_table = Hash.new(0)
        @candidate_words.each do |word|
            board.each_with_index do |letter, index|
                freq_table[word[index]] += 1 if letter.nil?
            end
        end
        freq_table
    end
end
