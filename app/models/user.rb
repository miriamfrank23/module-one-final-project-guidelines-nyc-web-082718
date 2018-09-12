class User < ActiveRecord::Base
  has_many :recommendations
  has_many :dessertplaces, through: :recommendations

  def self.destroy_database()
    User.destroy_all
  end

end
