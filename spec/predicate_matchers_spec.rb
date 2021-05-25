#predicate methods
puts 0.zero?
puts 3.even?
puts 3.odd?
puts [].empty?

RSpec.describe 'predicate methods and matchers' do
  it 'can be tested with Ruby methods' do
    result = 16 / 2
    expect(result.even?).to eq(true)
  end

  it 'can be tested with predicate matchers' do
     expect(16 / 2).to be_even
     expect(11).to be_odd
     expect(0).to be_zero
     expect([]).to be_empty
  end

  describe 0 do
    it { is_expected.to be_zero }
    #syntax the same as line 16
  end
end