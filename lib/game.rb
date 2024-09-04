# frozen_string_literal: true

# Game - logic of game
class Game
  def initialize
    # create a new game
  end

  # computer picks code
  def new_code
    @code = Array.new(4) { rand(1..6) }
  end

  # play_turn
  # player guesses code
  # computer responds with accuracy of guess
  # count to 12 turns
  # win or lose
end
