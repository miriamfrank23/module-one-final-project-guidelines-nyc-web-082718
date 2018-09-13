
require_relative '../config/environment'
require_relative '../app/models/dessertplace.rb'
require_relative  '../app/models/recommendation.rb'
require_relative '../app/models/user.rb'
require_relative '../lib/api_communicator.rb'
require_relative '../lib/CLI_methods.rb'
require_relative '../images/egglo.png'

#THis is how to add to the database
# u = User.create(name: 'name', zip_code: 12345)
# d = Dessertplace.create(name: 'name', zip_code: 12345, rating: 5, price: '$$$$',display_address: 'display_address', category: "category", url: "URL",image_url: 'image_url')
# r = Recommendation.create(user_id: u.id, dessertplace_id: d.id)

#how to search the database
# bibble = Dessertplace.find_by name: 'Bibble & Sip'


greet
user = returning_user?
user = User.make_user(user)
def find_recommendation_methods(user)
  dessert_type = asks_for_dessert_type
  pricerange = asks_for_dessert_price
  recommendation = Recommendation.return_recommendation(user, dessert_type, pricerange)
end
find_recommendation_methods(user)






#################################################################
#create Dessert database
def create_database
  Dessertplace.add_dessertplaces()
end

#calling one of these will empty the respective Database

# This will destroy entire dessert database
# def empty_dessert_db
#   Dessertplace.destroy_database()
# end

def empty_user_db
  User.destroy_database()
end

def empty_recommdation_db
  Recommendation.destroy_database()
end

binding.pry
puts "HELLO WORLD"
