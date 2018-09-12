class Recommendation < ActiveRecord::Base
  belongs_to :users
  belongs_to :dessertplaces
end
