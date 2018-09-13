class User < ActiveRecord::Base
  has_many :recommendations
  has_many :dessertplaces, through: :recommendations

  def self.make_user(user)
    if user == nil
      username = gets_name
      binding.pry
      zip_code = gets_zip
      user = User.create_user(username, zip_code)
      return user
    else
      puts "what whould you like to do?"
      puts "Chose from Below"
      puts "[1] - See old recommendations"
      puts "[2] - Get new recommendations"
      choice = gets.chomp
      if choice == '1'
        #have it display all old recommendations
      elsif choice == '2'
        return user
      else
        puts "pleace make a selection"
        User.make_user(user)
      end
      return user # need to return user because it is used later in the code
    end
  end

  def self.create_user(username, zip_code)
    user = User.create(name: username, zip_code: zip_code)
    puts "Your username is #{user.name} and your ID is #{user.id}"
    puts "Don't lose this its super important"
    puts
    puts
    return user
  end

  def change_zip_code
    puts "We only want the best for you, and there are no high quality dessert places that fit your criteria in the zip code you provided. Please provide us with another nearby zipcode."
    zip = gets.chomp
    self.zip_code = zip
    self.save
  end
end


def self.destroy_database()
  User.destroy_all
end
