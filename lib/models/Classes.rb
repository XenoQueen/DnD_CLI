class Classes

  attr_reader :name, :hit_die, :proficiencies, :saving_throws

  @@all = []

  def initialize(classes_data)
    puts classes_data
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

  def pretty_print
    puts @name
    puts "\n"
    puts "Hit Die:"
    puts @hit_die
    puts "\n"
    puts "Proficiencies:"
    puts @proficiencies
    puts "\n"
    puts "Saving Throws:"
    puts @saving_throws
  end
end
