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
  end
end
