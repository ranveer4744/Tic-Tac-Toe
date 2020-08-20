# Positions will be given as arrays with a row and column respectively (Ex. [0,1] is row 0 and column 1).
# Marks are spots on the grid where a player takes their turn.

class Board

    # Create a nxn board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    # Check if a position given is valid
    def valid?(pos)
        row, column = pos
        return true if (row < @grid.length && row >=0) && (column < @grid.length && column >= 0)
        false
    end

    # Check if the given position does not already contain another players mark.
    def empty?(pos)
        row, column = pos
        return true if valid?(pos) == true && @grid[row][column] == "_"
        false
    end

    # Place a given position on the board and change the current board value to the given mark.
    def place_mark(pos, mark)
        row, column = pos
        if valid?(pos) == false || empty?(pos) == false
            raise "Invalid position, please try again"
        else
            @grid[row][column] = mark
        end
    end
    
    def print
        @grid.each {|row| puts row.join(" ")}
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.count(mark) == @grid.length
                return true
            end
        end
        false
    end

    def win_col?(mark)
        col = 0
        while col < @grid.length
            count = 0
            @grid.each do |row|
                if row[col] != mark
                    col = col + 1
                    break
                else
                    count = count + 1
                end
            end
            return true if count == @grid.length
        end
        false
    end

    def win_diagonal?(mark)
        fake_grid = @grid.reverse # Reverse array for finding the 2nd diagonal
        diag1 = (0...@grid.length).collect {|i| @grid[i][i]} # diag1&2 will get both diagonal sides of the grid
        diag2 = (0...@grid.length).collect {|i| fake_grid[i][i]}

        return true if diag1.count(mark) == @grid.length || diag2.count(mark) == @grid.length
        false
    end

    def win?(mark)
        return true if win_col?(mark) == true || win_row?(mark) == true || win_diagonal?(mark) == true
        false
    end

    # Check if there are any remaining empty postions on the grid.
    def empty_position?
        return true if @grid.flatten.count("_") > 0
        false
    end

    # Find all positions which don't currently have a value.
    def legal_positions
        legal_pos_arr = []
        @grid.each.with_index do |row, row_index|
            row.each.with_index do |val, column_index|
                if val == "_"
                    legal_pos_arr << [row_index, column_index]
                end
            end
        end
        legal_pos_arr
    end
end