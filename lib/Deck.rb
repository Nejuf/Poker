
class Deck
  include Enumerable

  def initialize
    @cards = {}
    generate_deck
    @keys_array = @cards.keys
    @keys_array.shuffle!
  end

  def generate_deck
    Card::SUITS.each do |suit|
      (1..13).each do |num|
        @cards[suit+num.to_s] = Card.new(suit,num)
      end
    end
  end

  def length
    @keys_array.length
  end

  def draw_card
    card = @keys_array.pop
    @cards[card]
  end

  #For enumerable module
  def each
    @cards.each do |card_id, card|
      yield card
    end
  end
end