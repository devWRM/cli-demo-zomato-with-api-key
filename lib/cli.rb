# primary job of the CLI class is to provide the user interface - `gets` and `puts`
class ExampleCliWithZomato::CLI
  attr_reader :api
  attr_accessor :input

  def initialize
    @api = ExampleCliWithZomato::API.new
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
    puts "Type x to exit and any other key to continue"
    space
    get_user_input
    if input.downcase == "x"
      goodbye
    else
      show_main_menu
    end
  end

  def restaurant_list_prompt
    puts "Type the number of the restaurant you'd like to see details for."
    get_user_input
    validate_input
    # show requested data
    # make a method to do this
    # display_restaurant_details
    # right now, @input holds the user input - in string format
    # turn the string into an integer and offset the index
    index = input.to_i - 1
    restaurant = ExampleCliWithZomato::Restaurant.all[index]
    display_restaurant_details(restaurant)
  end

  def validate_input
    # valid input needs to be between 1 and 20
    # valid input needs to be a number (even though it will come in as a string)
    # if it's valid, use it
    # if it's not valid, tell the use and get new input
    # Ruby has a method called #between?
    while !(input.to_i >= 1 && input.to_i <= ExampleCliWithZomato::Restaurant.all.length) do
      space
      show_restaurant_list
      puts "Sorry that is not valid input.  Please choose a number corresponding to a restaurant."
      get_user_input
      space
    end
  end

  def display_restaurant_details(restaurant)
    space
    puts restaurant.name
    puts "Locality: #{restaurant.locality}"
    puts restaurant.address
    puts "Website: "
    puts restaurant.url
    puts "Cuisines: #{restaurant.cuisines}"
    puts "User rating: #{restaurant.rating}"
    space
  end

  def get_user_input
    self.input = gets.chomp
  end

  def show_restaurant_list
    space
    ExampleCliWithZomato::Restaurant.all.each.with_index(1) do |restaurant, index|
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

  def goodbye
    space
    puts "Thanks for using this app!  Enjoy Boise!"
    space
  end
end
