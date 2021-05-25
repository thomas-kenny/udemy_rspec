RSpec.describe Hash do
  subject(:orders) do
    { a: 1, b: 2 }
  end

  it 'has two key-value pairs' do
    expect(subject.length).to eq(2)
    expect(orders.length).to eq(2)
  end
end