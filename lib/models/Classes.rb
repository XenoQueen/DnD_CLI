class Classes

  attr_reader :name, :hit_die, :proficiencies, :saving_throws

  @@all = []

  def initialize(class_data)
    @name = class_data["name"]
    @hit_die = class_data["hit_die"]
    @proficiencies = class_data["proficiencies"]
    @saving_throws = class_data["saving_throws"]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find {|class| class.name.downcase == name.downcase}
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
