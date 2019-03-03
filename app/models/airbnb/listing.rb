class Listing
  attr_accessor :type, :city
  @@all = []

  def initialize(type, city)
    @type, @city = type, city
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_city(city)
    self.all.select{|x| x.city == city}
  end

  def trips
    Trip.all.select{|x| x.listing == self}
  end

  def guests
    self.trips.collect{|x| x.guest}
  end

  def trip_count
    self.guests.count
  end

  def self.most_popular
    # most_visited_num = self.all.collect{|x| x.trip_count}.max
    # self.all.find{|x| x.trip_count == most_visited_num}
    self.all.find{|x| x.trip_count == (self.all.collect{|x| x.trip_count}.max)}
  end

end
