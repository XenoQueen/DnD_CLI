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
    puts "Choose an option:"
    puts "1. Get Class list"
    puts "2. Get Race list"
    puts "3. Get Subclass list"
    puts "4. Get Subrace list"
    puts "5. Exit"

    user_input = gets.chomp

    if @user_input == "1"
      get_class_list
    elsif @user_input == "2"
      get_race_list
    elsif @user_input == "3"
      get_subclass_list
    elsif @user_input == "4"
      get_subrace_list
    elsif @user_input == "5"
      exit
    else
      puts "Invalid input".colorize(:red)
  end


end
