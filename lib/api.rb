# get data from the internet using scraping or hitting an API
module ExampleCliWithZomato
  class API
    BASE_URL = "https://developers.zomato.com/api/v2.1"

    def get_city_restaurants(entity_id=664, entity_type="city")
      response = HTTParty.get(
        "#{BASE_URL}/search?entity_id=#{entity_id}&entity_type=#{entity_type}",
        {
          headers: {
            "Accept": "application/json",
            "user-key": ENV["ZOMATO_API_KEY"]
          }
        }
      )
      restaurants_array = response["restaurants"]
      restaurants_array.each do |restaurant_hash|
        restaurant_hash["restaurant"]
        info_hash = {
          name: restaurant_hash["restaurant"]["name"],
          url: restaurant_hash["restaurant"]["url"],
          address: restaurant_hash["restaurant"]["location"]["address"],
          locality: restaurant_hash["restaurant"]["location"]["locality"],
          city: restaurant_hash["restaurant"]["location"]["city"],
          zipcode: restaurant_hash["restaurant"]["location"]["zipcode"],
          cuisines: restaurant_hash["restaurant"]["cuisines"],
          rating: restaurant_hash["restaurant"]["user_rating"]["aggregate_rating"]
        }
        ExampleCliWithZomato::Restaurant.new(info_hash)
      end
    end
  end
end

# API docs:  looks like I need "Accept" and "user-key" headers...
# curl -X GET --header "Accept: application/json" --header "user-key: 0e40775264f643c4910dc572c757fa4e" "https://developers.zomato.com/api/v2.1/categories"

# HTTParty docs: looks like the second argument is a hash with a headers key
#response = HTTParty.get('http://example.com', {
#   headers: {"User-Agent" => "Httparty"},
#   debug_output: STDOUT, # To show that User-Agent is Httparty
# })
