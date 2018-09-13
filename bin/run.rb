
require_relative '../config/environment'
require_relative '../app/models/dessertplace.rb'
require_relative  '../app/models/recommendation.rb'
require_relative '../app/models/user.rb'
require_relative '../lib/api_communicator.rb'
require_relative '../lib/CLI_methods.rb'

#THis is how to add to the database
# u = User.create(name: 'name', zip_code: 12345)
# d = Dessertplace.create(name: 'name', zip_code: 12345, rating: 5, price: '$$$$',display_address: 'display_address', category: "category", url: "URL",image_url: 'image_url')
# r = Recommendation.create(user_id: u.id, dessertplace_id: d.id)

#how to search the database
# bibble = Dessertplace.find_by name: 'Bibble & Sip'







def return_recommendation(dessert_type, pricerange)
  d = Dessertplace.where(category: dessert_type, price: pricerange)
  binding.pry
end


#create Dessert database
def create_database
  Dessertplace.add_dessertplaces()
end

#calling one of these will empty the respectie Database
# def empty_dessert_db
#   Dessertplace.destroy_database()
# end

def empty_user_db
  User.destroy_database()
end

def empty_recommdation_db
  Recommendation.destroy_database()
end

user = create_user
dessert_type = asks_for_dessert_type
pricerange = asks_for_dessert_price
return_recommendation(dessert_type, pricerange)

binding.pry

puts "HELLO WORLD"
