class Recommendation < ActiveRecord::Base
  belongs_to :users
  belongs_to :dessertplaces

  def self.add_recommendation()
    Recommendation.create(user_id, dessertplace_id)
  end


  def self.return_recommendation(user,dessert_type, pricerange)
    d = []
    d = Dessertplace.where(zip_code: user.zip_code, category: dessert_type, price: pricerange)
    if d.length == 0
      user.change_zip_code
      return_recommendation(user,dessert_type, pricerange)
    else
      d = d.sample
      puts d.name
      # Add to rec tabe
    end
  end

end
