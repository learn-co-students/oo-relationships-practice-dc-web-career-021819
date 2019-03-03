class Bakery
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def desserts
    Desserts.all.select{|x| x.bakery == self}
  end

  def ingredients
    self.desserts.collect{|x| x.ingredients}.flatten
  end

  def average_calories
    self.desserts.inject(0){|s, i| s + i.calories} / self.desserts.size
  end

  def shopping_list
    result = ""
    self.ingredients.each do |x|
      # binding.pry
      if x != self.ingredients[-1]
        result += "#{x.name}, "
      else
        result += "and #{x.name}"
      end
    end
    result
  end
end
