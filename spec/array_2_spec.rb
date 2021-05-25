RSpec.describe Array do
  subject(:sally) do
    ['name', 'age']
  end

  it 'has a length of two' do
    expect(subject.length).to eq(2)
    subject.pop
    expect(subject.length).to eq(1)
  end

  it 'has an alias of sally' do
    expect(sally).to eq(subject)
  end
end