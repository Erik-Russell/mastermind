# frozen_string_literal: true

# lib/game.rb

require_relative 'game_logic'

# Game - logic of game
class Game
  attr_reader :code

  def initialize
    @code = Array.new(4) { rand(1..6) }
    @turns = 0
  end

  def play_turn(guess)
    @turns += 1
    code_copy = @code.dup

    correct_position = GameLogic.correct_positions(guess, code_copy)
    correct_number = GameLogic.correct_numbers(guess, code_copy)

    puts "You got #{correct_position} digit(s) in the correct position"
    puts "You got #{correct_number} digit(s) correct but in the wrong position"
    puts "You have #{12 - @turns} turns left"

    return true if correct_position == 4

    if @turns >= 12
      puts "Sorry, you've run out of turns! the code was #{@code.join}."
      return true
    end

    false
  end
end
