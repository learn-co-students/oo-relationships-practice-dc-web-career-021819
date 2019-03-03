class Ride
  attr_accessor :passenger, :driver, :distance
  @@all = []

  def initialize(passenger, driver, distance)
    @passenger, @driver, @distance = passenger, driver, distance
    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    self.all.inject(0){|s, x| s + x.distance} / self.all.length
  end
end
