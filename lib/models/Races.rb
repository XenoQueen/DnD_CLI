class Races

  attr_reader :name, :size, :speed, :languages

  @@all = []

  def initialize(races_data)
    races_data = URI(BASE_URI + "races")
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|races| races.name.downcase == name.downcase}
    @name = races_data["name"]
    @size = races_data["size"]
    @speed = races_data["speed"]
    @languages = races_data["languages"]
    @@all << self
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
