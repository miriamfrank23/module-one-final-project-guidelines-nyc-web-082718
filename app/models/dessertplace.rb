class Dessertplace < ActiveRecord::Base
  has_many :recommendations
  has_many :users, through: :recommendations
end
