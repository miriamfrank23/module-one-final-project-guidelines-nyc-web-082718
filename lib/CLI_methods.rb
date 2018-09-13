require 'pry'

# String.colors
# String.modes
# String.color_samples
# binding.pry

def greet
  puts
  puts "Hi there! If you're looking for somewhere to get dessert in NYC tonight, you came to the right place. We will find you a highly rated and conveniently located dessert place to go tonight right now!".colorize(:light_magenta)
  puts ""
end


def returning_user?
  puts
  puts "Are you a returning user?"
  puts "Y or N"
  y_n = gets.chomp.downcase
  if y_n == 'y'
    puts
    puts "Please enter your username"
    username = gets.chomp
    puts
    puts "Please enter your user ID"
    userId = gets.chomp.to_i
    if User.exists?(name: username, id: userId)
      user = User.find_by name: username, id: userId
      return user
      # u = User.find_by name: 'Tom', id: 29
    else
      puts ""
      puts "Are you sure you have been here before?"
      puts
      returning_user?
    end
  elsif y_n == 'n'
  return nil
else returning_user?
  end
end


def gets_name
  puts ""
  puts "First, please give us a username to remember you by!"
  username = gets.chomp
  # if User.exists?(name: username)
  #   puts "That username is already taken, please enter another"
  #   username = gets.chomp
  #   username
  # else
    username
end


def gets_zip
  puts ""
  puts "Please give us your zip code so we can recommend a great place close by!"
  zip_code = gets.chomp
  if zip_code.length != 5
    puts "Please enter a 5 digit zip code"
    gets_zip
  else
    return zip_code
  end
end



def asks_for_dessert_type
  puts "We want to pick the perfect place for you; please answer a few questions below."
  puts ""
  puts "Please pick a dessert from the list below by entering a number 1-9:"
  puts "[1] - Ice Cream"
  puts "[2] - Cupcakes"
  puts "[3] - Donuts"
  puts "[4] - Chocolate"
  puts "[5] - Gelato"
  puts "[6] - Macarons"
  puts "[7] - Bakery Desserts"
  puts "[8] - Candy"
  puts "[9] - Surprise Me!"
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
    return 'candy'
  elsif dessert_type == '9'
    return 'desserts'
  else
    puts "Please enter one of the options below:"
    asks_for_dessert_type
  end
end


def asks_for_dessert_price
  puts
  puts "There are desserts of all prices in the city. How much are you looking to spend on your dessert? Please indicate your price ranges with dollar signs: one dollar sign ($) should indicate very inexpensive, and four dollar signs ($$$$) should indicate very expensive."
  dessert_price_range = gets.chomp
end

def goodbye(user)
  puts
  puts "Thanks for visiting, #{user.name}! We hope you love your dessert tonight! Please come back for more recommendations soon, remember, your user ID is #{user.id}. Goodbye!"
end

def repeat_recommendation?(user)
  puts "Would you like another recommendation right now?"
  puts "Y or N"
  y_n = gets.chomp.downcase
  # binding.pry
    if y_n == 'y'
      # binding.pry
      find_recommendation_methods(user)
    elsif y_n == 'n'
      # binding.pry
      goodbye(user)
    else puts "Please enter Y or N"
      repeat_recommendation?(user)
    end
end
