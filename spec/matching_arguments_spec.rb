# customize return value of a method depending on the argument(s) with which it's invoked.

RSpec.describe 'matching arguments' do
  it 'can return different values depending on the argument' do
    three_element_array = double # [1, 2, 3]

    allow(three_element_array).to receive(:first).with(no_args).and_return(1)
    allow(three_element_array).to receive(:first).with(1).and_return([1])
    allow(three_element_array).to receive(:first).with(2).and_return([1, 2])
    allow(three_element_array).to receive(:first).with(be >= 3).and_return([1, 2, 3])
    # allow double to receive the 'first' method with any argument >= 3 and return array of [1, 2, 3]
    # replicates .first method behaviour on ruby array without using full array

    expect(three_element_array.first).to eq(1)
    expect(three_element_array.first(1)).to eq([1])
    expect(three_element_array.first(2)).to eq([1, 2])
    expect(three_element_array.first(3)).to eq([1, 2, 3])
    expect(three_element_array.first(100)).to eq([1, 2, 3])
  end
end

# depending on what the argument is to mock method, you can customize reutrn value and thus allow 
# double to be as dynamic and flexible as it needs to be to most effecitvely mock behaviour of real life object.