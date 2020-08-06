class APIService

  BASE_URI = "https://www.dnd5eapi.co/api/"

  def fetch_class_by_name(name)
    uri = URI(BASE_URI + "classes/#{name}")
    classes = make_request(uri)
    if classes[0]
      Classes.new(classes[0])
    else
      puts "Could not find a class or race with that name.".colorize(:red)
    end
  end

  def fetch_race_by_name(name)
    uri = URI(BASE_URI + "races/#{name}")
    races = make_request(uri)
    races[0]
    Races.new(races[0])
    #else
      #puts "Could not find a race with that name.".colorize(:red)
    #end
  end

  def fetch_classes_list(classes)
    uri = URI(BASE_URI + "classes=#{classes}")
    classes = make_request(uri)
    classes_instances = classes.map do |classes_data|
      Classes.new(classes_data)
    end
  end

  def fetch_races_list(races)
    uri = URI(BASE_URI + "races=#{races}")
    races = make_request(uri)
    races_instances = races.map do |races_data|
      Races.new(races_data)
    end
    pp(races)
  end

  def make_request(uri)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
