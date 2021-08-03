# spies: fancy doubles that track the method calls they receive.
# allow syntax enables us to have some spy like functionality whenever we mock out methods on a real ruby object.

class Car
  def initialize(model)
    @model = model
  end
end

class Garage
  attr_reader :storage

  def initialize
    @storage = []
  end

  def add_to_collection(model)
    @storage << Car.new(model)
  end
end

# Testing functionality of the garage. Need to fake car class and car instance.

RSpec.describe Garage do
  let(:car) { instance_double(Car) }

  before do
    allow(Car).to receive(:new).and_return(car)
  end

  it 'adds a car to its storage' do
    subject.add_to_collection('Honda Civic')
    expect(Car).to have_received(:new).with('Honda Civic')
    expect(subject.storage.length).to eq(1)
    expect(subject.storage.first).to eq(car)
  end
end
