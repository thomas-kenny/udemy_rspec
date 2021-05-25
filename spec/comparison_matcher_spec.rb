RSpec.describe 'comparison matchers' do
  it 'allows for comparison with our built in Ruby operators' do
    expect(10).to be > 5
    expect(8).to be < 15

    expect(1).to be >= -1
    expect(1).to be <= 1
  end

  describe 100 do #same as subject { 100 }
    it { is_expected.to be > 90 }
    it { is_expected.to be >= 100 }
    it { is_expected.not_to be > 105 }
  end
end