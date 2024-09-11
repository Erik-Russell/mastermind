# frozen_string_literal: true

# requirements
# require 'colorize'
require_relative 'lib/game'

# player or computer guess
puts 'Would you like to guess or create the secret code?'
game_mode = gets.chomp

# initialize game

game = Game.new(game_mode)
game_over = false

# run game
game.choose_code if game_mode == 'create'
until game_over
  if game_mode == 'guess'
    game.generate_code
    game.guess_from_player
    game_over = game.play_turn
  end

  next unless game_mode == 'create'

  game.computer_guesses
  game_over = game.play_turn
end

# close game
puts "\t ==== GAME OVER ===="
