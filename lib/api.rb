# get data from the internet using scraping or hitting an API
class API
  def get_info
    response = HTTParty.get(
      "https://developers.zomato.com/api/v2.1/categories",
      {
        headers: {
          "Accept": "application/json",
          "user-key": ENV["ZOMATO_API_KEY"]
        }
      }
    )
    binding.pry
  end
end

# API docs:  looks like I need "Accept" and "user-key" headers...
# curl -X GET --header "Accept: application/json" --header "user-key: 0e40775264f643c4910dc572c757fa4e" "https://developers.zomato.com/api/v2.1/categories"

# HTTParty docs: looks like the second argument is a hash with a headers key
#response = HTTParty.get('http://example.com', {
#   headers: {"User-Agent" => "Httparty"},
#   debug_output: STDOUT, # To show that User-Agent is Httparty
# })
