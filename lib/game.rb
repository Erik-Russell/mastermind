# frozen_string_literal: true

# Game - logic of game
class Game
  attr_reader :code

  def initialize
    @code = Array.new(4) { rand(1..6) }
    @turns = 0
  end

  def play_turn(guess)
    puts "for test code:#{@code}"
    @turns += 1

    correct_position = 0
    correct_number = 0
    code_copy = @code.dup

    guess.each_with_index do |num, index|
      next unless num == code_copy[index]

      correct_position += 1
      code_copy[index] = nil
      guess[index] = nil
    end

    guess.each_with_index do |num, index|
      next if num.nil?

      if code_copy.include?(num)
        correct_number += 1
        code_copy[code_copy.index(num)] = nil
      end
    end

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
