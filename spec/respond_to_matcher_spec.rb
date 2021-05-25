class HotChocolate
  def drink
    'delicious'
  end

  def discard
    'PLOP!'
  end

  def purchase(number)
    "I just purchased #{number} hot chocolates"
  end
end

RSpec.describe HotChocolate do
  it 'confirms that an object can respond to a method' do
    expect(subject).to respond_to(:drink)
    expect(subject).to respond_to(:drink, :discard, :purchase)
  end

  it 'confirms an object can respond to a method with arguments' do
    expect(subject).to respond_to(:purchase).with(1).arguments
  end

  it { is_expected.to respond_to(:purchase, :discard) }
  it { is_expected.to respond_to(:purchase).with(1) }

end




# class Coffee
#   def drink; end
#   def discard; end
#   def purchase(number); end
# end
