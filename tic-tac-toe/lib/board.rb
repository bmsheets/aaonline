class Board
    attr_reader :grid

    def initialize(grid=[[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
        @grid = grid
    end

    def place_mark(position, mark)
        raise "Position already taken." unless empty?(position)
        grid[position.first][position.last] = mark
    end

    def empty?(position)
        grid[position.first][position.last] == nil
    end
    
    def winner
        return nil unless over?
        all_row_col_diag.each do |row|
            if three_in_row?(row)
                return row[0]
            end
        end
        nil
    end

    def over?
        return true if grid.flatten.none? {|mark| mark == nil}
        all_row_col_diag.any? {|row| three_in_row?(row)}
    end

    def three_in_row?(row)
        !row.include?(nil) && row.uniq.length == 1
    end

    def all_row_col_diag
        result = []      
        # add columns
        result << grid[0]
        result << grid[1]
        result << grid[2]
        # add rows
        result << [grid[0][0], grid[1][0], grid[2][0]]
        result << [grid[0][1], grid[1][1], grid[2][1]]
        result << [grid[0][2], grid[1][2], grid[2][2]]
        # add diagonals
        result << [grid[0][0], grid[1][1], grid[2][2]]
        result << [grid[0][2], grid[1][1], grid[2][0]]
        result
    end
end
