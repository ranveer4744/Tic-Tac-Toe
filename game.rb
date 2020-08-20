require_relative "human_player.rb"
require_relative "board.rb"
require_relative "computer_player.rb"


class Game
    def initialize(board_size, players_hash = {}) # Players hash will contain a mark as a key and a boolean stating if the player is human (false), or a computer A.I. (true).
        @player_arr = players_hash.map do |mark, bool|
            if bool == true
                ComputerPlayer.new(mark)
            else
                Humanplayer.new(mark)
            end
        end
        @board = Board.new(board_size)
        @current_player = @player_arr[0]
    end

    def switch_turn
        @player_arr.rotate!
        @current_player = @player_arr[0]
    end

    def play
        while @board.empty_position?
            system("clear")
            puts "\n #{@board.print} \n"
            positions = @board.legal_positions
            pos = @current_player.get_position(positions)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory! Player #{@current_player.mark} wins!\n#{@board.print}"
                return
            else
                switch_turn
            end
        end
        puts "Draw"
    end
end

if $PROGRAM_NAME == __FILE__
  machine_civil_war = Game.new(
      5,
      w:true,
      x:true,
      y:true,
      z:true
    )
  machine_civil_war.play
end