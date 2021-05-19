require 'pry'
require './lib/animal'
require './lib/zoo'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'Afternoon Zoo Spec Harness' do
  before :each do
    @animal_1 = Animal.new("Sea Otter", 10, 25)
    @animal_2 = Animal.new("Red Panda", 5, 70)
    @animal_3 = Animal.new("Capybara", 100, 150)
    @animal_4 = Animal.new("Dolphin", 150, 200)
    @animal_5 = Animal.new("Dog", 65, 200)
  end

  describe 'Iteration 1' do
    it '1. Animal Instantiation' do
      expect(Animal).to respond_to(:new).with(3).argument
      expect(@animal_1).to be_an_instance_of(Animal)
    end
  
    it '2. Animal Attributes' do
      expect(@animal_1).to respond_to(:kind).with(0).argument
      expect(@animal_1).to respond_to(:weight).with(0).argument
      expect(@animal_1).to respond_to(:age).with(0).argument
      
      expect(@animal_1.kind).to eq("Sea Otter")
      expect(@animal_1.weight).to eq("10 pounds")
      expect(@animal_1.age).to eq("25 weeks")
    end

    it '3. Animal age in days' do
      expect(@animal_1).to respond_to(:age_in_days).with(0).argument

      expect(@animal_1.age_in_days).to eq(175)
    end

    it '4. Animal can be fed and gain weight' do
      expect(@animal_1).to respond_to(:feed!).with(1).argument

      @animal_1.feed!(2)

      expect(@animal_1.weight).to eq("12 pounds")

      @animal_1.feed!(5)

      expect(@animal_1.weight).to eq("17 pounds")
    end
  end

  describe 'Iteration 2' do
    before :each do
      @zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    end

    it '1. Zoo instantiation' do
      expect(Zoo).to respond_to(:new).with(5).argument
      expect(@zoo).to be_an_instance_of(Zoo)
    end

    it '2. Zoo attributes' do
      expect(@zoo).to respond_to(:street).with(0).argument
      expect(@zoo).to respond_to(:city).with(0).argument
      expect(@zoo).to respond_to(:state).with(0).argument
      expect(@zoo).to respond_to(:zip_code).with(0).argument
      expect(@zoo).to respond_to(:inventory).with(0).argument
      
      expect(@zoo.street).to eq("2300 Southern Blvd")
      expect(@zoo.city).to eq("Bronx")
      expect(@zoo.state).to eq("NY")
      expect(@zoo.zip_code).to eq("10460")
      expect(@zoo.inventory).to eq([])
    end

    it '3. Zoo address' do
      expect(@zoo).to respond_to(:address).with(0).argument
      
      expect(@zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
    end
  
    it '4. Zoo adds animals' do
      expect(@zoo).to respond_to(:add_animal).with(1).argument

      @zoo.add_animal(@animal_1)
      @zoo.add_animal(@animal_2)

      expect(@zoo.inventory).to eq([@animal_1, @animal_2])
    end
  
    it '5. Zoo has animal count' do
      expect(@zoo).to respond_to(:animal_count).with(0).argument

      @zoo.add_animal(@animal_1)
      @zoo.add_animal(@animal_2)

      expect(@zoo.animal_count).to eq(2)
    end
  end

  describe 'Iteration 3' do
    before :each do
      @zoo.add_animal(@animal_1)
      @zoo.add_animal(@animal_2)
      @zoo.add_animal(@animal_3)
      @zoo.add_animal(@animal_4)
      @zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    end
    
    it '1. Zoo filters by age' do
      expect(@zoo).to respond_to(:animals_older_than).with(1).argument

      expect(@zoo.animals_older_than(250)).to eq([])
      expect(@zoo.animals_older_than(100)).to eq([@animal_3, @animal_4])
      expect(@zoo.animals_older_than(10)).to eq([@animal_1, @animal_2, @animal_3, @animal_4])
    end

    it '2. Zoo calculates total weight' do
      expect(@zoo).to respond_to(:total_weight_of_animals).with(0).argument
    
      expect(@zoo.total_weight_of_animals).to eq(265)
    end
  
    it '3. Zoo details' do
      expect(@zoo).to respond_to(:details).with(0).argument

      expected = {"total_weight" => 265, "street_address" => "2300 Southern Blvd"}

      expect(@zoo.details).to eq(expected)
    end
  end

  describe 'Iteration 4' do
    before :each do
      @zoo.add_animal(@animal_1)
      @zoo.add_animal(@animal_2)
      @zoo.add_animal(@animal_3)
      @zoo.add_animal(@animal_4)
      @zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    end 

    it '1. Zoo sorts by weight' do
      expect(@zoo).to respond_to(:animals_sorted_by_weight).with(0).argument
      
      expected = [@animal_4, @animal_3, @animal_1, @animal_2]

      expect(@zoo.animals_sorted_by_weight).to eq(expected)
    end

    it '2. Zoo generates animal hash' do
      expect(@zoo).to respond_to(:animal_hash).with(0).argument
      @zoo.add_animal(@animal_5)

      expected = {
        "C" => [@animal_3],
        "D" => [@animal_4, @animal_5],
        "R" => [@animal_2],
        "S" => [@animal_1]
        }
      expect(@zoo.animal_hash).to eq(expected)
    end
  end
end