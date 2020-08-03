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

  
end
