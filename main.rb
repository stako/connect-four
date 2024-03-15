# frozen_string_literal: true

require_relative "lib/connect_four"

@game = ConnectFour.new

def clean_print
  system "clear"
  @game.print_grid
end

def play_round
  valid_input = true

  loop do
    clean_print
    puts valid_input ? "" : "Error: Invalid column"
    print "Player #{@game.player} - Enter a column #: "
    column = @game.player_choice
    valid_input = column && @game.insert_token(@game.player, column)
    break if valid_input
  end

  @game.switch_players
end

def game_over?
  winner = @game.winner
  draw = @game.grid_full?
  return false unless winner || draw

  clean_print
  if winner
    puts "Game over - #{winner} wins!"
  else
    puts "Game over - Draw!"
  end
  true
end

play_round until game_over?
