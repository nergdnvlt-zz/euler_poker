require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/game.rb'

class GameTest < MiniTest::Test
  def test_it_exists
    game = Game.new('5H 5C 6S 7S KD 2C 3S 8S 8D TD')

    assert_instance_of Game, game
  end
end
