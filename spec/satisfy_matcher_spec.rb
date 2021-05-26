RSpec.describe 'satisfy matcher' do
  # subject { 'racecar' }
  subject { 'racecars' }


  it 'is a palindrome' do
    expect(subject).to satisfy { |word| word == word.reverse }
  end

  it 'can accept a custom error message' do
    expect(subject).to satisfy('be a palindrome') do |word|
      word == word.reverse
    end
  end
end