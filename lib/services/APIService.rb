class APIService

  BASE_URI = "https://www.dnd5eapi.co/api/"

  def fetch_class_by_name(name)
    uri = URI(BASE_URI + "classes/#{name}")
    classes = make_request(uri)
    if classes[0]
      Classes.new(classes[0])
    else
      fetch_race_by_name(name)
    end
  end

  def fetch_race_by_name(name)
    uri = URI(BASE_URI + "races/#{name}")
    race = make_request(uri)
    if race ["error"]
      puts "Could not find a class or race with that name.".colorize(:red)
    else
      Races.new(race)
    end
  end

  def fetch_classes_list
    uri = URI(BASE_URI + "classes")
    classes = make_request(uri)
    classes_instances = classes["results"].map do |classes_data|
      Classes.new(classes_data)
    end
  end

  def fetch_races_list(races)
    uri = URI(BASE_URI + "races")
    races = make_request(uri)
    races_instances = races["results"].map do |races_data|
      Races.new(races_data)
    end
  end

  def make_request(uri)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
