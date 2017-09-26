class Code
    PEG_TABLE = {
        "R" => :red,
        "G" => :green,
        "B" => :blue,
        "Y" => :yellow,
        "O" => :orange,
        "P" => :purple
    }
    attr_reader :pegs

    def initialize(pegs)
        @pegs = pegs
    end
    
    def self.random
        pegs = []
        4.times do 
            pegs << PEG_TABLE.keys.sample
        end
        Code.new(pegs)
    end 

    def self.parse(input)
        pegs = []
        input.chars.each do |char|
            if PEG_TABLE.keys.include?(char.upcase) && pegs.length < 5
                pegs << char.upcase
            else
                raise "Invalid peg input given."
            end 
        end
        raise "Not enough pegs given." if pegs.length < 4
        Code.new(pegs)
    end

    def exact_matches(other_code)
        count = 0
        self.pegs.each_with_index do |peg, idx|
            count += 1 if peg == other_code.pegs[idx]
        end
        count 
    end

    def near_matches(other_code)
        count = 0
        self.pegs.each_with_index do |peg, idx|
            if peg != other_code.pegs[idx] && other_code.pegs.include?(peg)
                count += 1
            end
        end
        count 
    end
end

class Game
    attr_reader :secret_code
    attr_accessor :num_turns

    def initialize
        @num_turns = 0
        @secret_code = Code.random
        puts secret_code.pegs
    end
    
    def play
        puts "Welcome to mastermind."
        guess = get_guess
        report_matches(guess)
        until game_over?(guess)
            guess = get_guess
            report_matches(guess)
        end
    end

    def get_guess
        self.num_turns += 1
        puts "Enter your four character guess (from RGBYOP)"
        guess = Code.parse(gets.chomp)
    end

    def game_over?(guess)
       num_turns >= 10 || secret_code.exact_matches(guess) == 4
    end

    def report_matches(guess)
        exact = secret_code.exact_matches(guess)
        near = secret_code.near_matches(guess)
        if exact == 4
            puts "Congratulations, you win!"
        else
            puts "Exact matches: #{exact}, Near matches: #{near}"
        end
    end
end

game = Game.new
game.play
