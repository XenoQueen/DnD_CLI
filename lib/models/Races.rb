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

  def self.find_by_name(name)
    @@all.find {|race| race.name.downcase == name.downcase}
  end

  def pretty_print
    puts @name
    puts "\n"
    puts "Size:"
    puts @size
    puts "\n"
    puts "Speed:"
    puts @speed
    puts "\n"
    puts "Languages:"
    puts @languages
  end
end
