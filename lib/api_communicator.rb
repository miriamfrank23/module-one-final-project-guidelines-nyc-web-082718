require "http"
require "json"
require "optparse"
require 'pry'

API_KEY = "UQOowjKGaEk453tdAubg-eHbJFT9RXG4Ku1yJr4rKhHe8j5Ejo4qLOV6Vit6IXNx3xI8DpNnXvjhcb0IINfdqfKXGSe7K2jEoZWfaO6iKXfVFgDE7Na7ZLMW0imYW3Yx"

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


def search(term, location, offset)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: 50,
    offset: offset
  }
  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end
