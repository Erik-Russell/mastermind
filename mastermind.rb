# frozen_string_literal: true

# requirements
# require 'colorize'
require_relative 'lib/game'

# initialize game

game = Game.new
game_over = false

# run game
until game_over
  # get guess from player
  puts 'Enter your guess as a four digit number (e.g. 3246)'

  input = gets.chomp

  # Validate
  if input.match?(/^\d{4}$/)
    guess = input.chars.map(&:to_i)
  else
    puts 'Invalid input! Please enter only numbers'
    next
  end

  game_over = game.play_turn(guess)
end

# close game
puts "\t ==== GAME OVER ===="
