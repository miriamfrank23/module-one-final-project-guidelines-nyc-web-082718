class User < ActiveRecord::Base
  has_many :recommendations
  has_many :dessertplaces, through: :recommendations

  def self.create_user
    User.create(name: gets_name, zip_code: gets_zip)
  end

  def self.destroy_database()
    User.destroy_all
  end

  def change_zip_code
    puts "We only want the best for you, and there are no high quality dessert places that fit your criteria in the zip code you provided. Please provide us with another nearby zipcode."
    zip = gets.chomp
    self.zip_code = zip
    self.save
  end

end
