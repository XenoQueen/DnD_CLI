class CLI

  def run
    system("clear")
    @user_input = nil
    @api = APIService.new
    @api.fetch_classes_list
    welcome

    until @user_input == "4"
      main_menu
    end
  end

  def welcome
    puts "Welcome to a Dungeons & Dragons 5E character repository!".colorize(:yellow)
    "\n"
  end

  def main_menu
    puts "What would you like to do?".colorize(:green)
    puts "1. Get Classes list".colorize(:light_blue)
    puts "2. Get Races list".colorize(:light_blue)
    puts "3. Search for specific class or race".colorize(:light_blue)
    puts "4. Exit".colorize(:light_blue)

    @user_input = gets.chomp

    if @user_input == "1"
      get_classes_list
    elsif @user_input == "2"
      get_races_list
    elsif @user_input == "3"
      search_for_class_or_race
    elsif @user_input == "4"
      puts "Fair travels adventurer!".colorize(:green)
      exit
    else
      puts "Invalid input: #{@user_input}".colorize(:red)
    end
  end

  def get_classes_list

    Classes.all.each {|c| puts c.name}
    #sort_by_hit_die
  end

  def get_races_list
    races = @api.fetch_races_list(@list)
    races.each {|r| puts r}
    #sort_by_size
  end

  def search_for_class_or_race
    print "What class or race would you like to search for?".colorize(:green)
    input = gets.chomp
    classes = @api.fetch_class_by_name(input)
    begin
      classes.pretty_print
    rescue
      puts "Could not find a class or race with that name.".colorize(:red)
    end
  end
end
