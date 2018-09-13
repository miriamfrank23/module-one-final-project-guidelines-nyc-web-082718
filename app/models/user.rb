class User < ActiveRecord::Base
  has_many :recommendations
  has_many :dessertplaces, through: :recommendations

  def self.make_user(user)
    if user == nil
      username = gets_name
      # binding.pry
      zip_code = gets_zip
      user = User.create_user(username, zip_code)
      return user
    else
      puts
      puts "What whould you like to do?".colorize(:light_magenta)
      puts "Please pick an option from the list below by entering a number 1, 2 or 3:".colorize(:light_magenta)
      puts "[1] - See old recommendations".colorize(:light_magenta)
      puts "[2] - Get new recommendations".colorize(:light_magenta)
      puts "[3] - Exit".colorize(:light_magenta)
      choice = gets.chomp
      if choice == '1'
        old = Recommendation.return_old_recommendations(user.id)
        User.make_user(user)
      elsif choice == '2'
        return user
      elsif choice == '3'
        goodbye(user)
      else
        puts "Please make a selection".colorize(:light_cyan)
        User.make_user(user)
      end
      return user # need to return user because it is used later in the code
    end
  end

  def self.create_user(username, zip_code)
    user = User.create(name: username, zip_code: zip_code)
    puts
    puts "Your username is #{user.name}, and your user ID is #{user.id}".colorize(:light_cyan)
    puts "Please remember these so you can pick up right where you left off when you come back for more recommendations!".colorize(:light_magenta)
    puts
    return user
  end

  def change_zip_code
    puts
    puts "We only want the best for you, and there are no high quality dessert places that fit your criteria in the zip code you provided. Please provide us with another nearby zip code.".colorize(:light_magenta)
    zip = gets.chomp
    self.zip_code = zip
    self.save
  end
end


def self.destroy_database()
  User.destroy_all
end
