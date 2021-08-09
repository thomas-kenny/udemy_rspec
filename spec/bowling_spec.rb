class Bowling
  attr_reader :score

  def initialize
    @score = 0
  end

  def hit(pin_count)
    @score += pin_count
  end

end

RSpec.describe Bowling, "#score" do
  context "with no strikes or spares" do
    it "sums the pin count for each roll" do
      bowling = Bowling.new
      20.times { bowling.hit(4) }
      expect(bowling.score).to eq(80)
    end
  end
end