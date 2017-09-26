class Code
    PEGS = {
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

    def [](i)
        pegs[i]
    end

    def ==(other_code)
        return false if !other_code.is_a?(Code)
        self.pegs == other_code.pegs
    end
    
    def self.random
        pegs = []
        4.times do 
            pegs << PEGS.keys.sample
        end
        Code.new(pegs)
    end 

    def self.parse(input)
        pegs = []
        input.chars.each do |char|
            if PEGS.keys.include?(char.upcase) && pegs.length < 5
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
        matches = 0
        other_count = other_code.color_count
        self.color_count.each do |color, count|
            next unless other_count.include?(color)
            matches += [count, other_count[color]].min 
        end
        matches - exact_matches(other_code)
    end

    def color_count
        count = Hash.new(0)
        pegs.each do |peg|
            count[peg] += 1
        end
        count
    end
end

class Game
    attr_reader :secret_code
    attr_accessor :num_turns

    def initialize(secret_code = Code.random)
        @num_turns = 0
        @secret_code = secret_code
        #puts secret_code.pegs
    end
    
    def play
        puts "Welcome to mastermind."
        guess = get_guess
        display_matches(guess)
        until game_over?(guess)
            guess = get_guess
            display_matches(guess)
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

    def display_matches(guess)
        exact = secret_code.exact_matches(guess)
        near = secret_code.near_matches(guess)
        if exact == 4
            puts "Congratulations, you win!"
        else
            puts "exact matches: #{exact}, near matches: #{near}"
        end
    end
end

#game = Game.new
#game.play
