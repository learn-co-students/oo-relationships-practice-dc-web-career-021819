class Guest
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_name(name)
    self.all.select{|x| x.name == name}
  end

  def trips
    Trip.all.select{|x| x.guest == self}
  end

  def listings
    self.trips.collect{|x| x.listing}
  end

  def trip_count
    self.listings.count
  end

  def self.pro_traveller
    self.all.select{|x| x.trip_count > 1}
  end
end
