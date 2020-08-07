class Races

  attr_reader :name, :size, :speed, :languages

  @@all = []

  def initialize(races_data)
    @name = races_data["name"]
    @size = races_data["size"]
    @speed = races_data["speed"]
    @languages = races_data["languages"]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|races| races.name.downcase == name.downcase}
  end

  def pretty_print
    puts @name.colorize(:cyan)
    puts "\n"
    puts "Size:".colorize(:yellow)
    puts @size
    puts "\n"
    puts "Speed:".colorize(:yellow)
    puts @speed
    puts "\n"
    puts "Languages:".colorize(:yellow)
    puts @languages.map {|l| l["name"]}
  end
end
