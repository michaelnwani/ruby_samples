#Listing 15.8 - cardtest.rb: Testing the dealing accuracy of PlayingCards::Deck
require 'minitest/unit'
require 'minitest/autorun'
require_relative 'cards'

class CardTest < MiniTest::Unit::TestCase
  def setup #magic to MiniTest; if defined, it is executed before every test method
    @deck = PlayingCards::Deck.new
  end
  
  def test_deal_one
    @deck.deal
    assert_equal(51, @deck.size)
  end
  
  def test_deal_many
    @deck.deal(5)
    assert_equal(47, @deck.size)
  end
  
end