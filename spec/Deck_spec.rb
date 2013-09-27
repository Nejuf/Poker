require "Deck"

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do

    it "should contain 52 cards" do
      expect(deck.length).to eq 52
    end

  end

  describe "#draw_card" do

    it "should return a random card" do
      expect(deck.draw_card).to be_a Card
    end

    it "should remove that card from the deck" do
      deck.draw_card
      expect(deck.length).to eq 51
    end


  end

end