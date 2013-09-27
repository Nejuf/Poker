
class Deck
  include Enumerable

  def initialize
    @cards = {}
    Card::SUITS.each do |suit|
      (1..13).each do |num|
        @cards[suit+num.to_s] = Card.new(suit,num)
      end
    end
  end

  def length
    @cards.length
  end

  #For enumerable module
  def each
    @cards.each do |card_id, card|
      yield card
    end
  end
end