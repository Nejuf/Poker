
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
    0
  end

  private

      def royal_flush?

      end

      def straight_flush?

      end

      def four_of_a_kind?

      end

      def full_house?

      end

      def straight?

      end

      def three_of_a_kind?

      end

      def two_pair?

      end

      def one_pair?

      end

      def high_card

      end

end