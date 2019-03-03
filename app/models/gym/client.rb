class Client
  attr_accessor :name, :trainer
  @@all = []

  def initialize(name, trainer = nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def assign_trainer(trainer)
    self.trainer = trainer
  end
end
