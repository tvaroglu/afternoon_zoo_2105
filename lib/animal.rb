class Animal
  attr_reader :kind, :age
  attr_accessor :weight

  def initialize(kind='Unknown', weight=1, age=0)
    @kind = kind.to_s
    @weight = "#{weight.to_s} pounds"
    @age = "#{age.to_s} weeks"
  end

  def age_in_days
    return (self.age.split(' ')[0].to_i) * 7
  end

  def feed!(quantity_in_lb)
    current_weight = self.weight.split(' ')[0].to_i
    new_weight = current_weight + quantity_in_lb
    self.weight = "#{new_weight.to_s} pounds"
  end

end
