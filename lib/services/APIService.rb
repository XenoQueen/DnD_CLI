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

  
end
