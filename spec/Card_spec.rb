require "Card"

describe Card do

  describe "#initialize" do

    it "should raise error if given an invalid suit or number" do
      expect{card = Card.new("a", 15)}.to raise_error
    end

    it "should have suit match given suit" do
      suit = "c"
      card = Card.new(suit, 1)
      expect(card.suit.downcase).to eq(suit)
    end

    it "should have number match given number" do
      num = 13
      card = Card.new("s", num)
      expect(card.number).to eq(num)
    end
  end

end