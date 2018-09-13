class Recommendation < ActiveRecord::Base
  belongs_to :users
  belongs_to :dessertplaces

  # def self.add_recommendation(user_id, dessertplace_id)
  #   binding.pry
  #   Recommendation.create(user_id, dessertplace_id)
  # end


  def self.return_recommendation(user,dessert_type, pricerange)
    d = []
    d = Dessertplace.where(zip_code: user.zip_code, category: dessert_type, price: pricerange)
    if d.length == 0
      user.change_zip_code
      return_recommendation(user,dessert_type, pricerange)
    else
      d = d.sample
      puts "You should go to: #{d.name}"
      puts "Located on: #{d.display_address}"
      puts ""
      Recommendation.create(user_id: user.id, dessertplace_id: d.id)
      # Recommendation.add_recommendation(user.id, d.id)
      # Add to rec tabe
    end
  end


  def self.return_old_recommendations(user_id)
    array = Recommendation.where(user_id: user_id)
    Dessertplace.gets_info_prior_rec(array)
  end
end
