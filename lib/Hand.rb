
class Hand
  CATEGORY_RANKING = {
    :royal_flush => 1,
    :straight_flush => 2,
    :four_of_a_kind => 3,
    :full_house => 4,
    :flush => 5,
    :straight => 6,
    :three_of_a_kind => 7,
    :two_pair => 8,
    :one_pair => 9,
    :high_card => 10
  }

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def length
    @cards.length
  end

  def category_ranking
    return 1 if royal_flush?
    return 2 if straight_flush?
    return 3 if four_of_a_kind?
    return 4 if full_house?
    return 5 if flush?
    return 6 if straight?
    return 7 if three_of_a_kind?
    return 8 if two_pair?
    return 9 if one_pair?
    return 10 if high_card
  end

  private

      def royal_flush?
        straight_flush? && @cards.all?{ |card| card.number >= 10 || card.number == 1}
      end

      def straight_flush?
        flush? && straight?
      end

      def four_of_a_kind?
        num_card_occurrences.has_value?(4)
      end

      def full_house?
        three_of_a_kind? && one_pair?
      end

      def flush?
        suit = @cards[0].suit
        @cards.all? {|card| card.suit == suit}
      end

      def straight?
        sorted_numbers = num_card_occurrences.keys.sort
        return true if sorted_numbers == [1,10,11,12,13]
        4.times do |index|
          return false if sorted_numbers[index+1] - sorted_numbers[index] != 1
        end
        true
      end

      def three_of_a_kind?
        num_card_occurrences.has_value?(3)
      end

      def two_pair?
        num_card_occurrences.values.find_all { |num_cards| num_cards == 2 }.length == 2
      end

      def one_pair?
        num_card_occurrences.has_value?(2)
      end

      def high_card
        sorted_numbers = num_card_occurrences.keys.sort
        if sorted_numbers == [1,10,11,12,13]
          return @cards.select { |card| card.number == 1 }.first
        else
          @cards.sort_by(&:number).pop
        end
      end

      def num_card_occurrences
        hash = Hash.new(0)
        @cards.each do |card|
          hash[card.number] += 1
        end
        return hash
      end

end