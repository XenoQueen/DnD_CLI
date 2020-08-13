class Classes

  attr_reader :name, :hit_die, :proficiencies, :saving_throws

  @@all = []

  def initialize(classes_data)
    @name = classes_data["name"]
    @hit_die = classes_data["hit_die"]
    @proficiencies = classes_data["proficiencies"]
    @saving_throws = classes_data["saving_throws"]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find { |classes| classes.name.downcase == name.downcase }
  end

  def self.sort_by_hit_die(hit_die)
    @@all.sort_by do {|classes_data| classes_data.hit_die}
  end

  def pretty_print
    puts @name.colorize(:cyan)
    puts "\n"
    puts "Hit Die:".colorize(:yellow)
    puts @hit_die
    puts "\n"
    puts "Proficiencies:".colorize(:yellow)
    puts @proficiencies.map {|p| p["name"]}
    puts "\n"
    puts "Saving Throws:".colorize(:yellow)
    puts @saving_throws.map {|s| s["name"]}
  end
end
