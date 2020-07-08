# primary job of the CLI class is to provide the user interface - `gets` and `puts`
class CLI
  attr_reader :api, :input

  def initialize
    @api = API.new
    @input = ""
  end

  # self # what is self? in an class method, it's the class - the class used to call the method

  # self # what is self? in an instance method, it's an instance - the instance used to call the method

  def start
    api.get_city_restaurants # instantiates all our restaurants
    welcome
    show_main_menu
    # get_user_input
    # show_secondary_menu
    # ask_if_user_wants_to_continue
    #   if user_wants_to_continue
    #     show_main_menu
    #   else
    #     goodbye
    #   end
  end

  def show_main_menu
    show_restaurant_list
    restaurant_list_prompt
    puts "Type 1 to continue"
    puts "Type 2 to exit"
  end

  def restaurant_list_prompt
    puts "Type the number of the restaurant you'd like to see deatails for."
    get_user_input
    
  end

  def get_user_input
    self.input = gets.chomp
  end

  def show_restaurant_list
    space
    Restaurant.all.each.with_index(1) do |restaurant, index|
      puts "#{index}. #{restaurant.name}"
    end
    space
  end

  def welcome
    space
    puts "Welcome to the Restaurant guide for Boise.  Maybe later more cities!"
    space
  end

  def space
    puts ""
  end
end
