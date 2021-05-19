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


end
