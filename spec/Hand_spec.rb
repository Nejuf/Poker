require 'Hand'

describe Hand do

  describe "#initialize" do
    let(:card1) { double("card1", :class => Card) }
    let(:card2) { double("card2", :class => Card) }
    let(:card3) { double("card3", :class => Card) }
    let(:card4) { double("card4", :class => Card) }
    let(:card5) { double("card5", :class => Card) }

    let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

    it "when initializing, a hand should have 5 cards" do
      hand.cards.length.should == 5
    end

    it "when initializing, a hand should only contain cards" do
      hand.cards.all? do |card|
        card.class == Card
      end.should == true
    end

  end

  describe "#category_ranking" do

    describe "#royal_flush?" do
      let(:card1) { Card.new("c", 10) }
      let(:card2) { Card.new("c", 11) }
      let(:card3) { Card.new("c", 12) }
      let(:card4) { Card.new("c", 13) }
      let(:card5) { Card.new("c", 1) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be a royal flush" do
        expect(hand.category_ranking).to eq 1
      end
    end

    describe "#straight_flush?" do
      let(:card1) { Card.new("c", 2) }
      let(:card2) { Card.new("c", 3) }
      let(:card3) { Card.new("c", 4) }
      let(:card4) { Card.new("c", 5) }
      let(:card5) { Card.new("c", 6) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be a straight flush" do
        expect(hand.category_ranking).to eq 2
      end
    end

    describe "#four_of_kind?" do
      let(:card1) { Card.new("c", 4) }
      let(:card2) { Card.new("d", 4) }
      let(:card3) { Card.new("s", 4) }
      let(:card4) { Card.new("h", 4) }
      let(:card5) { Card.new("s", 3) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be a four of a kind" do
        expect(hand.category_ranking).to eq 3
      end
    end

    describe "#full_house?" do
      let(:card1) { Card.new("c", 10) }
      let(:card2) { Card.new("h", 10) }
      let(:card3) { Card.new("d", 10) }
      let(:card4) { Card.new("s", 2) }
      let(:card5) { Card.new("c", 2) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be a full house" do
        expect(hand.category_ranking).to eq 4
      end
    end

    describe "#flush?" do
      let(:card1) { Card.new("c", 1) }
      let(:card2) { Card.new("c", 3) }
      let(:card3) { Card.new("c", 5) }
      let(:card4) { Card.new("c", 7) }
      let(:card5) { Card.new("c", 10) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be a flush" do
        expect(hand.category_ranking).to eq 5
      end
    end

    describe "#straight?" do
      let(:card1) { Card.new("s", 1) }
      let(:card2) { Card.new("c", 2) }
      let(:card3) { Card.new("s", 3) }
      let(:card4) { Card.new("c", 4) }
      let(:card5) { Card.new("h", 5) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be a straight" do
        expect(hand.category_ranking).to eq 6
      end
    end

    describe "#three_of_a_kind?" do
      let(:card1) { Card.new("c", 5) }
      let(:card2) { Card.new("d", 5) }
      let(:card3) { Card.new("s", 5) }
      let(:card4) { Card.new("d", 7) }
      let(:card5) { Card.new("c", 8) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be a three of a kind" do
        expect(hand.category_ranking).to eq 7
      end
    end

    describe "#two_pair?" do
      let(:card1) { Card.new("c", 3) }
      let(:card2) { Card.new("d", 3) }
      let(:card3) { Card.new("h", 1) }
      let(:card4) { Card.new("s", 1) }
      let(:card5) { Card.new("d", 11) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be two pair" do
        expect(hand.category_ranking).to eq 8
      end
    end

    describe "#one_pair?" do
      let(:card1) { Card.new("h", 10) }
      let(:card2) { Card.new("s", 10) }
      let(:card3) { Card.new("d", 4) }
      let(:card4) { Card.new("d", 7) }
      let(:card5) { Card.new("c", 9) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be a pair" do
        expect(hand.category_ranking).to eq 9
      end
    end

    describe "#high_card" do
      let(:card1) { Card.new("c", 6) }
      let(:card2) { Card.new("d", 1) }
      let(:card3) { Card.new("h", 9) }
      let(:card4) { Card.new("s", 4) }
      let(:card5) { Card.new("h", 12) }

      let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }

      it "should be high card" do
        expect(hand.category_ranking).to eq 10
      end
    end

    # describe "#?" do
    #   let(:card1) { Card.new("", ) }
    #   let(:card2) { Card.new("", ) }
    #   let(:card3) { Card.new("", ) }
    #   let(:card4) { Card.new("", ) }
    #   let(:card5) { Card.new("", ) }
    #
    #   let(:hand) { Hand.new( [card1, card2, card3, card4, card5] ) }
    #
    #   it "should be a " do
    #     expect(hand.category_ranking).to eq
    #  end
    # end
  end
end