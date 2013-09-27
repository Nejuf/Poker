require "Card"

describe Card do

  describe "#initialize" do

    it "should raise error if given an invalid suit or number" do
      expect{card = Card.new("a", 15)}.to raise_error
    end
  end

end