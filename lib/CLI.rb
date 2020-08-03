class CLI

  def run
    system("clear")
    @user_input = nil
    @api = APIService.new
    @page = 1
    welcome
    until @user_input == "2"
      main_menu
    end
    puts "Goodbye!"
  end

  def welcome
    puts "Welcome to a Dungeons & Dragons 5E character repository!".colorize(:blue)
    "\n"
  end

  def main_menu
    puts "What would you like to do?"
    puts "1. Get Class list"
    puts "2. Get Race list"
    #puts "3. Get Subclass list"
    #puts "4. Get Subrace list"
    puts "3. Search for specific class or race"
    puts "4. Exit"

    user_input = gets.chomp

    if @user_input == "1"
      get_class_list
    elsif @user_input == "2"
      get_race_list
    elsif @user_input == "3"
      search_for_class_or_race
    elsif @user_input == "4"
      exit
    else
      puts "Invalid input".colorize(:red)
  end

  def get_class_list
    classes = @api.fetch_class_list(@list)
    classes.each {|c| c.pretty_print}
  end

  def get_race_list
    races = @api.fetch_race_list(@list)
    races.each {|c| c.pretty_print}
  end

  def search_for_class_or_race
    print "What class or race would you like to search for?"
    input = gets.chomp
    classes = @api.fetch_class_by_name(input)
    classes.pretty_print
    races = @api.fetch_race_by_name(input)
    races.pretty_print
  end
end
