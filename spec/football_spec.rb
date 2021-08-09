class Football
  attr_reader :score

  def initialize
    @score = 0
  end

  def win
    @score +=3
  end

  def draw
    @score += 1
  end
end

RSpec.describe Football do
  it "adds three points for a win" do
    football = Football.new
    football.win
    expect(football.score).to eq(3)
  end
  it "adds one point for a draw" do
    football = Football.new
    football.draw
    expect(football.score).to eq(1)
  end

  it "can calculate score from multiple wins and draws" do
    football = Football.new
    5.times { football.win }
    10.times { football.draw }
    expect(football.score).to eq(25)
  end
end