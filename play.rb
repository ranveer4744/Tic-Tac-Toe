require_relative "human_player.rb"
require_relative "board.rb"
require_relative "computer_player.rb"
require_relative "game.rb"

puts "Enter an the size of the board"
board_size = gets.chomp.to_i
puts "How many human players?"
human_players = gets.chomp.to_i
puts "How many computer AI players?"
computer_players = gets.chomp.to_i
total_players = computer_players + human_players

num_of_added_players = 0

players_hash = {}

while num_of_added_players < total_players
    if num_of_added_players < human_players
        add_human_player(players_hash, human_players)
    elsif num_of_added_players < computer_players
        add_computer_player(players_hash, computer_players)
    end
end

done = false
game = Game.new(board_size, players_hash)
game.play


