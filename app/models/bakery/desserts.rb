class Desserts
  attr_accessor :bakery, :name
  @@all = []

  def initialize(name, bakery)
    @name, @bakery = name, bakery
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredients
    Ingredient.all.select{|x| x.dessert == self}
  end

  def calories
    self.ingredients.inject(0){|sum, i| sum + i.calorie}
  end
end
