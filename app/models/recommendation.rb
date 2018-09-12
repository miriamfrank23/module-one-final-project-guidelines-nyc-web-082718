class Recommendation < ActiveRecord::Base
  belongs_to :users
  belongs_to :dessert_places
end
