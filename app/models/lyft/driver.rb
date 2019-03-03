class Driver
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def rides
    Ride.all.select{|x| x.driver == self}
  end

  def passengers
    self.rides.collect{|x| x.passenger}.uniq
  end

  def total_distance
    self.rides.inject(0.0){|s, x| s + x.distance}
  end

  def self.mileage_cap(distance_cap)
    self.all.select{|x| x.rides[0].driver.total_distance > distance_cap}
  end
end
