require 'pry'

def greet
  puts "Hi there! If you're looking for somewhere to get dessert in NYC tonight, you came to the right place."
end

def gets_name
  puts "First, please give us a username to remember you by!"
  username = gets.chomp
  # if User.exists?(name: username)
  #   puts "That username is already taken, please enter another"
  #   username = gets.chomp
  #   username
  # else
    username
  # end
end

def gets_zip
  puts "Please give us your zip code so we can recommend a great place close by!"
  zip_code = gets.chomp
  zip_code
end

def create_user
  User.create(name: gets_name, zip_code: gets_zip)
end

# greet
# gets_name
# gets_zip
# create_user
# binding.pry

def asks_for_dessert_type
  puts "We want to pick the perfect place for you; please answer a few questions below."
  puts "What type of dessert sounds good to you? For example, do you want ice cream, frozen yogurt, cupcakes, donuts, candy, or something else?"
  "Please pick a dessert from the list below."
  dessert_type = gets.chomp
end

def asks_for_dessert_price
  puts "There are desserts of all prices in the city. How much are you looking to spend on your dessert? Please indicate your price ranges with dollar signs: one dollar sign ($) is should indicate very inexpensive, and four dollar signs ($$$$) should indicate very expensive."
  dessert_price_range = gets.chomp
end
