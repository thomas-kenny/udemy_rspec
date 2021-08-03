# if we want to mock a class method we need class_double
class Deck
  def self.build
    # logic to build a bunch of cards - irrelevant to CardGame, just needs to exist
  end
end


class CardGame
  attr_reader :cards

  def start
    @cards = Deck.build # invoking build on Deck itself (class method)
  end
end

RSpec.describe CardGame do
  it 'can only implement class methods that are defined on a class' do
    deck_klass = class_double(Deck, build: ['Ace', 'Queen']).as_stubbed_const
    # not mocking instance of Deck, rather the methods we define have ot exist as class methods on Deck class itself
    # as_stubbed_const: esnures whenever Deck is used, replace all call to Deck with class double
    # therefore doesn't matter whether Deck class is defined or not (always gets replaced by double)

    expect(deck_klass).to receive(:build)
    subject.start
    expect(subject.cards).to eq(['Ace', 'Queen'])
  end
end

# whenever we have a class / instance method that relies on another class, good idea to mock that other class out
# if mocking out an instance of another class then good to use an instance_double
# if mocking out the class itself then we want to use a class_double
# used class_double here because functionality that we wanted to mock out (build method) did not exist on an instance of Deck, but the class itself.
# in order to mock Deck class itself use class_double method and pass in class name and hash where keys represent class methods, and values represent return values for those class methods.
# as_stubbed_const ensures / verifies whenever Deck is used moving forwards we make sure it is replaced by class_double