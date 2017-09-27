class HumanPlayer

    def initialize(name)
        @name = name
    end

    def prompt
        puts "Please enter your target coordinates (e.g. 5,3)"
    end

    def get_play
        gets.chomp.split(",").map {|elem| Integer(elem)}
    end
end
