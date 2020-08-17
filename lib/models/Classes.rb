class Classes

  attr_reader :name, :hit_die, :proficiencies, :saving_throws

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_details(classes_data)
    @hit_die = classes_data["hit_die"]
    @proficiencies = classes_data["proficiencies"]
    @saving_throws = classes_data["saving_throws"]
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    found_class = @@all.find { |classes| classes.name.downcase == name.downcase }
  end

  def self.find_or_create_by_name(name)
    found_class = @@all.find { |classes| classes.name.downcase == name.downcase }
    if found_class.hit_die
      found_class
    else
      APIService.new.fetch_class_by_name(name)
    end
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
