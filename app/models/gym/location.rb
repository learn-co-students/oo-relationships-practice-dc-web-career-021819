class Location
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def check_trainer(trainer)
    LocationTrainer.all.select{|x| x.trainer == trainer && x.location == self}.empty?
  end
  # lt11 = location1.regist_trainer(trainer1)

  def regist_trainer(trainer)
    if self.check_trainer(trainer)
      LocationTrainer.new(self, trainer)
    end
  end

  def self.least_clients
    self.all.min_by{|x| LocationTrainer.all.select{|y| y.location == x}.count}
  end

end
