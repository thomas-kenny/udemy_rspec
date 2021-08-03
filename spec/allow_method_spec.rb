RSpec.describe 'allow method review' do
  it 'can cusomize return value for methods on doubles' do
    calculator = double
    allow(calculator).to receive(:add).and_return(15)
    #method on our double we've explicitly said should return 15 whenever it's invoked
    expect(calculator.add).to eq(15)
    expect(calculator.add(3)).to eq(15)
    expect(calculator.add(-2, -3, -5)).to eq(15)
    expect(calculator.add('hello')).to eq(15)
  end

  it 'can stub one or more methods on a real object' do
     arr = [1, 2, 3]
     allow(arr).to receive(:sum).and_return(10)
     expect(arr.sum).to eq(10)

     arr.push(4)
     expect(arr).to eq([1, 2, 3, 4])
  end

  it 'can return multiple return values in sequence' do
    mock_array = double
    allow(mock_array).to receive(:pop).and_return(:c, :b, nil)
    expect(mock_array.pop).to eq(:c)
    expect(mock_array.pop).to eq(:b)
    expect(mock_array.pop).to be_nil
    expect(mock_array.pop).to be_nil
    expect(mock_array.pop).to be_nil
  end
end

# can pass in either a ruby double (eg. 1 and 3) or a ruby object (eg. 2) in to allow method, then call .to receive
# to define what symbol/method you want to modify, and provide one or more return values that the double will give back
# whenever method is invoked on that given object.
# power and flexibility means we can mock any object and make it respond how we want for purpose of the test.