# frozen_string_literal: true

# lib/game.rb

require_relative 'game_logic'

# Game - logic of game
class Game
  attr_reader :code

  def initialize(game_mode)
    @game_mode = game_mode
    @code = []
    @turns = 0
    @game_over = false
    @guess = 0o000
  end

  def generate_code
    @code = Array.new(4) { rand(1..6) }
  end

  def choose_code
    loop do
      puts 'Enter the 4-digit code you wish the computer to guess'
      input = gets.chomp
      if GameLogic.valid_code(input)
        @code = input.chars.map(&:to_i)
        break
      end
    end
  end

  def guess_from_player
    loop do
      puts 'Enter your guess as a four digit number'
      input = gets.chomp
      if GameLogic.valid_code(input)
        @guess = input.chars.map(&:to_i)
        break
      end
    end
  end

  def computer_guesses
    @guess = Array.new(4) { rand(1..6) }
  end

  def play_turn
    @turns += 1
    code_copy = @code.dup

    correct_position = GameLogic.correct_positions(@guess, code_copy)
    correct_number = GameLogic.correct_numbers(@guess, code_copy)

    puts "You got #{correct_position} digit(s) in the correct position"
    puts "You got #{correct_number} digit(s) correct but in the wrong position"
    puts "You have #{12 - @turns} turns left"

    if correct_position == 4
      puts "Congratulations! You've guessed the correct code: #{@code.join}."
      return true
    end

    if @turns >= 12
      puts "Sorry, you've run out of turns! the code was #{@code.join}."
      return true
    end

    false
  end
end
