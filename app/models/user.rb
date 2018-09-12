class User < ActiveRecord::Base
  has_many :recommendations
  has_many :dessert_places, through: :recommendations
end
