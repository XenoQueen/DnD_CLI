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

end
