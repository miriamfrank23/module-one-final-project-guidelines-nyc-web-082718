class Recommendation < ActiveRecord::Base
  belongs_to :users
  belongs_to :dessertplaces

  def self.add_recommendation()
    Recommendation.create(user_id, dessertplace_id)
  end
end
