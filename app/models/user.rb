class User < ActiveRecord::Base
  has_many :recommendations
  has_many :dessertplaces, through: :recommendations
end
