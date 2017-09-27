class Board
    attr_reader :grid

    def initialize(grid = self.class.default_grid)
        @grid = grid
    end

    def [](pos)
        i, j = pos
        grid[i][j]
    end

    def []=(pos, val)
        i, j = pos
        self.grid[i][j] = val
    end

    def self.default_grid
        Array.new(10) { Array.new(10) }
    end

    def display
        (0...grid.length).each do |i|
            (0...grid.length).each do |j|
                print grid[i][j]
            end
            print "\n"
        end
    end

    def count
        grid.flatten.count { |elem| elem == :s }
    end

    def empty?(pos = nil)
        if pos
            i, j = pos
            grid[i][j] == nil
        else 
            count == 0            
        end
    end

    def full?
        grid.flatten.none? { |elem| elem == nil }
    end

    def won?
        count == 0 
    end

    def place_random_ship
        raise "Error: Board is full." if full?
        pos = random_position
        until empty?(pos)
            pos = random_position
        end
        grid[pos[0]][pos[1]] = :s
    end

    def random_position
        [rand(grid.length), rand(grid.length)] 
    end
=begin

    def populate_grid
    end

    def in_range?(pos)
    end
=end
end
