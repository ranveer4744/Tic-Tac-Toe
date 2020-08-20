class Humanplayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(positions)
        valid_pos = false
        while !valid_pos
            puts "Player #{@mark}, enter a position as a row and column (Ex. 2 2)."
            pos = gets.chomp.split
            if pos.any? {|word| word =~ /[[:alpha:]]/} || pos.length != 2 || positions.include?(pos.map(&:to_i)) == false 
                puts "Invaild input! Please ensure only 2 digits are entered with a space inbetween."
            else
                valid_pos = true
            end
        end
        pos.map(&:to_i)
    end
end

