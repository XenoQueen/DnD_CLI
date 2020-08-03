class APIService

  BASE_URI = "https://www.dnd5eapi.co/"

  def fetch_class_by_name(name)
    uri = URI(BASE_URI + "?name=#{name}")
    classes = make_request(uri)
    if classes[0]
      Classes.new(classes[0])
    else
      "Could not find a class with that name.".colorize(:red)
    end
  end

  def fetch_race_by_name(name)
    uri = URI(BASE_URI + "?name=#{name}")
    races = make_request(uri)
    if races[0]
      Races.new(races[0])
    else
      "Could not find a race with that name.".colorize(:red)
    end
  end

  
end
