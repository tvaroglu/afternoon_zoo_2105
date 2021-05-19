require_relative 'animal'

class Zoo
  attr_reader :name, :street, :city, :state, :zip_code, :inventory

  def initialize(name='City Zoo', street='123 Main St', city='San Juan', state='PR', zip_code='00901')
    @name = name.to_s
    @street = street.to_s
    @city = city.to_s
    @state = state.to_s
    @zip_code = zip_code.to_s
    @inventory = Array.new
  end

  def address
    return "#{self.street} #{self.city}, #{self.state} #{self.zip_code}"
  end

  def animal_count
    return self.inventory.length
  end

  def add_animal(new_animal)
    if new_animal.class == Animal
      self.inventory << new_animal
    end
  end

  def animals_older_than(x_weeks_old)
    if x_weeks_old.class != Integer
      x_weeks_old = x_weeks_old.to_s.to_i
    end
    return self.inventory.select do |animal|
      animal.age.split(' ')[0].to_i > x_weeks_old
    end
  end

  def total_weight_of_animals
    return self.inventory.reduce(0) do |total_weight, animal|
      total_weight + animal.weight.split(' ')[0].to_i
    end
  end

  def details
    return {
      'total_weight' => self.total_weight_of_animals,
      'street_address' => self.street
    }
  end

end
