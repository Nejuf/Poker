require_relative "Player"
require_relative "Deck"
require_relative "Hand"

class Poker

  attr_accessor :players, :deck, :pot

  def initialize
    @players = [Player.new(100), Player.new(100), Player.new(100), Player.new(100)]
    @deck = Deck.new
    @hands = {}
    deal_start_hands
    @pot = 0
  end

  def deal
    @players.each do |player|
      until player.hand.length >= 5
        player.hand << @deck.draw_card
      end
    end
  end

  private
    def deal_start_hands
      @players.each do |player|
        cards = []
        5.times {cards << @deck.draw_card}
        player.hand = Hand.new(cards)
      end
    end
end