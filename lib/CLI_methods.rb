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



# greet
# gets_name
# gets_zip
# create_user
# binding.pry

def asks_for_dessert_type
  puts "We want to pick the perfect place for you; please answer a few questions below."
  puts "Please pick a dessert from the list below. Number 1-8:"
  puts "[1] - Ice Cream"
  puts "[2] - Cupcakes"
  puts "[3] - Donuts"
  puts "[4] - Chocolate"
  puts "[5] - Gelato"
  puts "[6] - Macarons"
  puts "[7] - Bakery Desserts"
  puts "[8] - Suprise Me!"
  dessert_type = gets.chomp
  if dessert_type == '1'
    return 'icecream'
  elsif dessert_type == '2'
    return 'cupcakes'
  elsif dessert_type == '3'
    return 'donuts'
  elsif dessert_type == '4'
    return 'chocolate'
  elsif dessert_type == '5'
    return 'gelato'
  elsif dessert_type == '6'
    return 'macarons'
  elsif dessert_type == '7'
    return 'bakeries'
  elsif dessert_type == '8'
    return 'desserts'
  else
    puts "Please enter one of the options below:"
    asks_for_dessert_type
  end
end





def asks_for_dessert_price
  puts "There are desserts of all prices in the city. How much are you looking to spend on your dessert? Please indicate your price ranges with dollar signs: one dollar sign ($) is should indicate very inexpensive, and four dollar signs ($$$$) should indicate very expensive."
  dessert_price_range = gets.chomp
end
