class Prince
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

RSpec.describe Prince do
  subject { described_class.new('Thomas') }
  let(:james) { described_class.new('James') }
  
  it 'represents a great royal' do
    expect(subject.name).to eq('Thomas')
    expect(james.name).to eq('James')
  end
end

