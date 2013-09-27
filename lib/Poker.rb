require_relative "Player"
require_relative "Deck"
require_relative "Hand"

class Poker

  attr_accessor :players, :deck, :pot

  def initialize
    @players = [Player.new(100), Player.new(100), Player.new(100), Player.new(100)]
    @deck = Deck.new
    @hands = {}
    @players.each do |player|
      player.hand = Hand.new
    end
    @pot = 0
  end
end