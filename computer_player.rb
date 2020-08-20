class ComputerPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(positions) #Positions will be an array with all of the empty postions.
        random_pos = rand(positions.length)
        puts "Player #{@mark} chose position #{positions[random_pos]}."
        positions[random_pos]
    end
end