require "http"
require "json"
require "optparse"
require 'pry'

API_KEY = "UQOowjKGaEk453tdAubg-eHbJFT9RXG4Ku1yJr4rKhHe8j5Ejo4qLOV6Vit6IXNx3xI8DpNnXvjhcb0IINfdqfKXGSe7K2jEoZWfaO6iKXfVFgDE7Na7ZLMW0imYW3Yx"

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path

num = 10
SEARCH_LIMIT = num


def search(term, location)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: SEARCH_LIMIT
  }
  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end

def run(term, location)
  search(term, location)
end

def search_calls(search_result, number)
  i = 0
  list = []
  while i < number
    name = search_result["businesses"][i]["name"]
    rating = search_result["businesses"][i]["rating"]
    zip_code = search_result["businesses"][i]["location"]["zip_code"]
    image_url = search_result["businesses"][i]["image_url"]
    type = search_result["businesses"][i]["categories"][0]["alias"]
    # if type == "icecream"
    if type = search_result["businesses"][i]["categories"][0]["alias"] == "icecream"
      list << "#{name}, #{rating}, #{zip_code}, #{type}"
    end
    display_address = search_result["businesses"][i]["location"]["display_address"][0]
    #its an array of alias. so can call with 1 or 2
    # binding.pry
    i += 1
    binding.pry
  end
end

search_result = run('Ice Cream', 'New York City')
search_calls(search_result, num)
