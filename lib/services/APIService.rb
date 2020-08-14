class APIService

  BASE_URI = "https://www.dnd5eapi.co/api/"

  def fetch_class_by_name(name)
    uri = URI(BASE_URI + "classes/#{name}")
    classes = make_request(uri)
    if classes["name"]
      Classes.new(classes)
    else
      fetch_race_by_name(name)
    end
  end

  def fetch_race_by_name(name)
    uri = URI(BASE_URI + "races/#{name}")
    race = make_request(uri)
    unless race ["error"]
      Races.new(race)
    end
  end

# (done) when you first get the list of classes, instantiate Classes objects with just their name
# then, when a user selects to see details of a certain class,
# look for that class and its details, if the details are already there, show them
# otherwise, make the request for that class's details
# we are preventing asking the API for the same data more than once

  def fetch_classes_list
    uri = URI(BASE_URI + "classes")
    classes = make_request(uri)
    classes_instances = classes["results"].map do |classes_data|
      Classes.new classes_data["name"]
    end
  end

  def fetch_races_list(races)
    uri = URI(BASE_URI + "races")
    races = make_request(uri)
    races_instances = races["results"].map do |races_data|
      races_data["name"]
    end
  end

  def make_request(uri)
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
