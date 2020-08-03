class Races

  attr_reader :name, :size, :speed, :languages

  @@all = []

  def initialize(race_data)
    @name = race_data["name"]
    @size = race_data["size"]
    @speed = race_data["speed"]
    @languages = race_data["languages"]
    @@all << self
  end

  def self.all
    @@all
  end

  
end
