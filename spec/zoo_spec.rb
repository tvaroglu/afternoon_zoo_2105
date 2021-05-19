require 'rspec'
require_relative '../lib/animal'
require_relative '../lib/zoo'

RSpec.describe Zoo do
  it 'initializes' do
    zoo = Zoo.new('Bronx Zoo', '2300 Southern Blvd', 'Bronx', 'NY', '10460')

    expect(zoo).to be_an_instance_of(Zoo)

    expect(zoo.name).to eq('Bronx Zoo')
    expect(zoo.street).to eq('2300 Southern Blvd')
    expect(zoo.city).to eq('Bronx')
    expect(zoo.state).to eq('NY')
    expect(zoo.zip_code).to eq('10460')
    expect(zoo.address).to eq('2300 Southern Blvd Bronx, NY 10460')

    expect(zoo.inventory).to be_an_instance_of(Array)
    expect(zoo.inventory.length).to eq(0)
  end

  it 'starts with an empty inventory' do
    zoo = Zoo.new

    expect(zoo.animal_count).to eq(0)
  end

  it 'can add animals to the inventory' do
    zoo = Zoo.new

    expect(zoo.animal_count).to eq(0)

    animals = [
      Animal.new('Sea Otter', 10, 25),
      Animal.new('Red Panda', 5, 70),
      Animal.new('Mongoose', 12, 17)
    ]

    animals.each { |animal| zoo.add_animal(animal) }

    expect(zoo.inventory.length).to eq(3)
    expect(zoo.animal_count).to eq(3)

    expect(zoo.inventory[0].kind).to eq('Sea Otter')
    expect(zoo.inventory[1].kind).to eq('Red Panda')
    expect(zoo.inventory[2].kind).to eq('Mongoose')
  end

  it 'can return animals older than a given number of weeks' do
    zoo = Zoo.new

    animals = [
      Animal.new('Sea Otter', 10, 25),
      Animal.new('Red Panda', 5, 70),
      Animal.new('Capybara', 100, 150),
      Animal.new('Dolphin', 150, 200)
    ]

    animals.each { |animal| zoo.add_animal(animal) }

    expect(zoo.animals_older_than(250)).to be_an_instance_of(Array)
    expect(zoo.animals_older_than(250).length).to eq(0)
    expect(zoo.animals_older_than(100).length).to eq(2)
    expect(zoo.animals_older_than(10).length).to eq(4)
  end

  it 'can return total weight and details' do
    zoo = Zoo.new

    animals = [
      Animal.new('Sea Otter', 10, 25),
      Animal.new('Red Panda', 5, 70),
      Animal.new('Capybara', 100, 150),
      Animal.new('Dolphin', 150, 200)
    ]

    animals.each { |animal| zoo.add_animal(animal) }

    expect(zoo.total_weight_of_animals).to eq(265)

    expect(zoo.details).to eq({
      "total_weight" => 265,
      "street_address" => "123 Main St"
    })
  end
end
