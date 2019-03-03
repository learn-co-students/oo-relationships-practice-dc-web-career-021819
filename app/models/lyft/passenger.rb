class Passenger
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
    Ride.all.select{|x| x.passenger == self}
  end

  def drivers
    self.rides.collect{|x| x.driver}
  end

  def total_distance
    self.rides.inject(0.0){|s, x| s + x.distance}
  end

  def self.premium_members
    self.all.select{|x| x.rides[0].passenger.total_distance > 100}
  end
end
