RSpec.describe 'equality matchers' do
  let(:a) { 3.0 }
  let(:b) { 3 }

  describe 'eq matcher' do
    it 'tests for value and ignores type' do
      expect(a).to eq(b)
    end
  end

  describe 'eql matcher' do
    it 'tests for the value, including same type' do
      expect(a).not_to eql(b)
    end
  end

  describe 'equal and be matcher' do
    let(:c) { [1, 2, 3] }
    let(:d) { [1, 2, 3] }
    let(:e) { c }

    it 'cares about object identity' do
      expect(c).to eq(d) #will pass
      expect(c).to eql(d) #will pass

      expect(c).to equal(e)
      expect(c).to be(e)

      expect(c).not_to equal(d)
      expect(c).not_to be([1, 2, 3])
      
    end
  end
end