# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move??(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
    attr_reader :towers
    
    def initialize
        @towers = [[3, 2, 1], [], []] 
    end

    def play
        until won?
            render
            from_tower, to_tower = select_move    
            move(from_tower, to_tower)
        end
        puts "Congratulations, you have won!"
    end

    def render
        towers.each_with_index do |tower, idx|
            puts "tower #{idx} has state #{tower}" 
        end
    end

    def select_move
        valid_range = (0..2)
        from_tower, to_tower = -1, -1
        until valid_range.include?(from_tower)
            puts "choose a from_tower"
            from_tower = gets.chomp.to_i
            puts "Invalid selection. (choose 0, 1, or 2)" unless valid_range.include?(from_tower)
        end
        until valid_range.include?(to_tower)
            puts "choose a to_tower"
            to_tower = gets.chomp.to_i
            puts "Invalid selection. (choose 0, 1, or 2)" unless valid_range.include?(to_tower)
        end
        unless valid_move?(from_tower, to_tower)
            puts "Invalid move."
            select_move
        end
        [from_tower, to_tower]
    end

    def won?
        complete = [4, 3, 2, 1]
        towers[1] == complete || towers[2] == complete
    end

    def valid_move??(from_tower, to_tower)
        # Must select different towers
        first_cond = from_tower != to_tower
        # "from_tower" array cannot be empty
        second_cond = !towers[from_tower].empty?
        # "to_tower" must be empty or have a larger ring
        third_cond = towers[to_tower].empty? || towers[from_tower].last < towers[to_tower].last
        first_cond && second_cond && third_cond
    end

    def move(from_tower, to_tower)
        #raise "Invalid move." unless valid_move?(from_tower, to_tower)
        towers[to_tower].push(towers[from_tower].pop)
    end
end

#game = TowersOfHanoi.new
#game.play
