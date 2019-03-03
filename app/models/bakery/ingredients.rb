class Ingredient
  attr_accessor :name, :dessert, :calorie
  @@all = []

  def initialize(name, calorie, dessert)
    @name, @calorie, @dessert = name, calorie, dessert
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_name(ingredient)
    self.all.select{|x| x.name.include?(ingredient)}
  end

  def bakery
    self.dessert.bakery
  end
end
