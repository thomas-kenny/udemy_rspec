RSpec.describe 'include matcher' do
  describe 'hot chocolate' do
    it 'checks for substring inclusion' do
      expect(subject).to include('hot')
      expect(subject).to include('choc')
      expect(subject).to include('late')
    end

    it { is_expected.to include('choc') }
  end

  describe [10, 20, 30] do
    it 'will check for inclusion, regardless of order' do
      expect(subject).to include(20, 30)
      expect(subject).to include(10, 30, 20)
    end

    it { is_expected.to include(20, 30, 10) }
  end

  describe ({ a: 2, b: 4 }) do
    it 'can check for a key existence' do
      expect(subject).to include(:a)
      expect(subject).to include(:b, :a)
    end

    it 'can check for a key-value pair' do
      expect(subject).to include(a: 2)
    end
    
    it { is_expected.to include(b: 4) }
  end
end
