# spies are an alternate type of test double, following slightly different patterns to doubles when it comes to testing.
# with doubles we would create a double  and give it a message, and expect double to recieve the message before we invoke the method that might send that message to the double
# ie.  we wrote expectation before the fact / we did anything with class or object under test

# spies follow pattern where we assert a message has been received after the fact / action occurs / method is invoked.
# double method places expectation before action, while spy places expectation after the action.
# advantage of spies: automatically observe all messages sent to an object even if we haven't explicitly defined them.

RSpec.describe 'spies' do
  let(:animal) { spy('animal') }

  it 'confirms that a message has been received' do
    animal.eat_food
    expect(animal).to have_received(:eat_food) # methods don't need to be defined
    expect(animal).not_to have_received(:eat_human)
  end

  it 'resets between examples' do
    expect(animal).not_to have_received(:eat_food)
  end

  it 'retains same functionality of a regular double' do
    animal.eat_food
    animal.eat_food
    animal.eat_food('Sushi')
    expect(animal).to have_received(:eat_food).exactly(3).times
    expect(animal).to have_received(:eat_food).at_least(2).times
    expect(animal).to have_received(:eat_food).with('Sushi')
  end

end