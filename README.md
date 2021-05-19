# Afternoon Zoo

## Instructions

* Fork this Repository
* Clone YOUR fork
* Compete the activity below
* Push your solution to your fork
* Submit a pull request from your repository to the turingschool-examples repository
* Make sure to put your name in your PR!

## Iteration 1

Starting with the existing tests, and then use TDD to create an `Animal` class that
responds to the following interaction pattern: 

(Where you see something like `#<Animal:0x00007fccd30375f8...>`, this is
shorthand for a full animal object with that object identifier - we have
replaced any attributes with `...` for readability.)

Notes: There are seven days in a week.

```ruby
pry(main)> require './lib/animal'
#=> true

pry(main)> animal_1 = Animal.new("Sea Otter", 10, 25)
#=> #<Car:0x00007fa53b9ca0a8...>

pry(main)> animal_1.kind
#=> "Sea Otter"

pry(main)> animal_1.weight
#=> "10 pounds"

pry(main)> animal_1.age
#=> "25 weeks"

pry(main)> animal_1.age_in_days
#=> 175

pry(main)> animal_1.feed!(2)

pry(main)> animal_1.weight
#=> "12 pounds"

pry(main)> animal_1.feed!(1)

pry(main)> animal_1.weight
#=> "13 pounds"
```

## Iteration 2

Use TDD to create a `Zoo` class that responds to the following interaction
pattern:

(Where you see something like `#<Zoo:0x00007fccd30375f8...>`, this is
shorthand for a full zoo object with that object identifier - we have
replaced any attributes with `...` for readability.)

```ruby

pry(main)> require './lib/animal'
#=> true

pry(main)> require './lib/zoo'
#=> true

pry(main)> zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
#=> #<Zoo:0x00007fccd30375f8...>

pry(main)> zoo.street
#=> "2300 Southern Blvd"

pry(main)> zoo.city
#=> "Bronx"

pry(main)> zoo.state
#=> "NY"

pry(main)> zoo.zip_code
#=> "10460"

pry(main)> zoo.address
#=> "2300 Southern Blvd Bronx, NY 10460"

pry(main)> zoo.inventory
#=> []

pry(main)> zoo.animal_count
#=> 0

pry(main)> animal_1 = Animal.new("Sea Otter", 10, 25)
#=> #<Car:0x00007fa53b9ca0a8...>

pry(main)> animal_2 = Animal.new("Red Panda", 5, 70)
#=> #<Car:0x00007fccd2985f48...>

pry(main)> zoo.add_animal(animal_1)

pry(main)> zoo.add_animal(animal_2)

pry(main)> zoo.inventory
#=> [#<Animal:0x00007fa53b9ca0a8...>, #<Animal:0x00007fccd2985f48...>]

pry(main)> zoo.animal_count
#=> 2
```

## Iteration 3

Use TDD to up date your `Zoo` class so that it responds to the following interaction pattern:

Note: `animals_older_than()` is going by weeks old.

```ruby
pry(main)> require './lib/animal'
#=> true

pry(main)> require './lib/zoo'
#=> true

pry(main)> zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
#=> #<Zoo:0x00007fccd30375f8...>

pry(main)> animal_1 = Animal.new("Sea Otter", 10, 25)
#=> #<Animal:0x00007fccd29b5720...>

pry(main)> animal_2 = Animal.new("Red Panda", 5, 70)
#=> #<Animal:0x00007fccd2985f48...>

pry(main)> animal_3 = Animal.new("Capybara", 100, 150)
#=> #<Animal:0x00007fccd383c2d0...>

pry(main)> animal_4 = Animal.new("Dolphin", 150, 200)
#=> #<Animal:0x00007fccd297dc30...>

pry(main)> zoo.add_animal(animal_1)

pry(main)> zoo.add_animal(animal_2)

pry(main)> zoo.add_animal(animal_3)

pry(main)> zoo.add_animal(animal_4)

pry(main)> zoo.animals_older_than(250)
#=> []

pry(main)> zoo.animals_older_than(100)
#=> [#<Animal:0x00007fccd383c2d0...>, #<Animal:0x00007fccd297dc30...>]

pry(main)> zoo.animals_older_than(10)
#=> [#<Animal:0x00007fccd29b5720...>, #<Animal:0x00007fccd2985f48...>, #<Animal:0x00007fccd383c2d0...>, #<Animal:0x00007fccd297dc30...>]

pry(main)> zoo.total_weight_of_animals
#=> 265

pry(main)> zoo.details
#=> {"total_weight" => 265, "street_address" => "2300 Southern Blvd"}
```

## Iteration 4

Use TDD to update your `Zoo` class so that it responds to the following
interaction pattern:

Note: 
* Sorted by weight should be from heaviest to lightest.
* Animal hash generates a hash where the key is the first letter of the kind of animal
and the value is an array of animals that start with that letter of the alphabet

```ruby
pry(main)> require './lib/animal'
#=> true

pry(main)> require './lib/zoo'
#=> true

pry(main)> zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
#=> #<Zoo:0x00007fccd30375f8...>

pry(main)> animal_1 = Animal.new("Sea Otter", 10, 25)
#=> #<Animal:0x00007fccd29b5720...>

pry(main)> animal_2 = Animal.new("Red Panda", 5, 70)
#=> #<Animal:0x00007fccd2985f48...>

pry(main)> animal_3 = Animal.new("Capybara", 100, 150)
#=> #<Animal:0x00007fccd383c2d0...>

pry(main)> animal_4 = Animal.new("Dolphin", 150, 200)
#=> #<Animal:0x00007fccd297dc30...>

pry(main)> zoo.add_animal(animal_1)

pry(main)> zoo.add_animal(animal_2)

pry(main)> zoo.add_animal(animal_3)

pry(main)> zoo.add_animal(animal_4)

zoo.animals_sorted_by_weight
#=> [#<Animal:0x00007fccd297dc30...>,#<Animal:0x00007fccd383c2d0...>,#<Animal:0x00007fccd2985f48...,#<Animal:0x00007fccd29b5720...>]

pry(main)> animal_5 = Animal.new("Dog", 65, 200)
#=> #<Animal:0x00007fccd297dc30...>

pry(main)> zoo.add_animal(animal_5)
#=> #<Animal:0x00007f23d297dc30...>

pry(main)> zoo.animal_hash
#=> {
"C" => [#<Animal:0x00007fccd383c2d0...>],
"D" => [#<Animal:0x00007f23d297dc30...>, #<Animal:0x00007fccd297dc30...>],
"R" => [#<Animal:0x00007fccd2985f48...>],
"S" => [#<Animal:0x00007fccd29b5720...>]
}
```
