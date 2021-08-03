# stricter alternative called a verifying double
# similar to double but verifies that interface of double matches that of class/instance it is mocking.
# RSpec checks methods defined on double match names of instance methods defined on a real life class

class Person
  def a(seconds)
    sleep(seconds)
    "Hello"
  end
end

RSpec.describe Person do
  describe 'regular double' do
    it 'can implement any method' do
      person = double(a: "Hello", b: 20)
      expect(person.a).to eq("Hello")
    end
  end

  describe 'instance double' do
    it 'can only implement methods that are defined on the class' do
      # person = instance_double(Person, a: "Hello", b: 20)
      # throws an error as instance of Person doesn't have method 'b'

      person = instance_double(Person)
      allow(person).to receive(:a).with(3).and_return("Hello")
      expect(person.a(3)).to eq("Hello")
    end
  end
end

# instance double is another method we pass the class whose instance we want to make a double of
# verifies api/interface of double matches that of real life class - prevents a lot of errors/bugs
# checks methods on double designed to emulate instance methods on class match methods defined on real life class (same arguments, etc)
# much stricter than regular double but ensures stability and security in tests and is strongly preferred.
