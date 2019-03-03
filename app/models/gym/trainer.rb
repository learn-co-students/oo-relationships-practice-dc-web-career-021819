class Trainer
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def check_location(location)
    LocationTrainer.all.select{|x| x.trainer == self && x.location == location}.empty?
  end

  def regist_location(location)
    if self.check_location(location)
      LocationTrainer.new(location, self)
    end
  end

  def find_client
    Client.all.select{|c| c.trainer == self}
  end

  def self.most_clients
    self.all.max_by{|x| x.find_client.count}
  end

end
