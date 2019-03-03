class LocationTrainer
  attr_accessor :location, :trainer
  @@all = []

  def initialize(location, trainer)
    @location, @trainer = location, trainer
    @@all << self
  end

  def self.all
    @@all
  end

  def self.check_trainer(trainer)
    self.all.select{|x| x.trainer == trainer} ? true : false
  end

  def self.check_location(location)
    self.all.select{|x| x.location == location} ? true : false
  end

end
