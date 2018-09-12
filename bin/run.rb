
require_relative '../config/environment'
require_relative '../app/models/dessertplace.rb'
require_relative  '../app/models/recommendation.rb'
require_relative'../app/models/user.rb'
require_relative'../lib/api_communicator.rb'

u = User.create(name: 'name', zip_code: 12345)
d = Dessertplace.create(name: 'name', zip_code: 12345, rating: 5, price: '$$$$',display_address: 'display_address', category: "category", url: "URL",image_url: 'image_url')
r = Recommendation.create(user_id: u.id, dessertplace_id: d.id)

puts "HELLO WORLD"
