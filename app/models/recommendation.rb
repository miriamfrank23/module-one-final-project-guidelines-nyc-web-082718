class Recommendation < ActiveRecord::Base
  belongs_to :users
  belongs_to :dessertplaces

  def self.make_recommendation(user, d)
      d = d.sample
      puts
      puts Paint["You should go to: #{d.name}", :cyan, :bright]
      puts Paint["Located on: #{d.display_address}", :cyan, :bright]
      puts ""
      Recommendation.create(user_id: user.id, dessertplace_id: d.id)
      repeat_recommendation?(user)
    end


    def self.return_recommendation(user,dessert_type, pricerange)
      d = []
      d = Dessertplace.where(zip_code: user.zip_code, category: dessert_type, price: pricerange)
      if d.length == 0
        puts
        puts "There are no places in this zip code that meet your criteria.".colorize(:light_magenta)
        puts
        puts "Would you like to give us another zip code?".colorize(:light_magenta)
        puts
        puts "If not, we can recommend a top-tier dessert place somewhere in NYC for you right now, but it could be anywhere in the city.".colorize(:light_magenta)
        puts
        puts "Please indicate Y to enter another zip code or N to get a recommendation somewhere in NYC".colorize(:light_cyan)
        y_n = gets.chomp.downcase
        if y_n == 'y'
          user.change_zip_code
          return_recommendation(user,dessert_type, pricerange)
        elsif y_n == 'n'
          d = Dessertplace.where(category: dessert_type, price: pricerange)
          if d.length == 0
            puts "There are no places that fit your criteria in the City"
            puts "Would you like to change your criteria?"
            puts "Please indicate Y or N"
            yes_no = gets.chomp.downcase
            if yes_no == 'y'
              find_recommendation_methods(user)
            elsif yes_no == 'n'
              goodbye(user)
            else
              goodbye(user)
            end
          else
            Recommendation.make_recommendation(user, d)
          end
        else
          self.return_recommendation(user,dessert_type, pricerange)
        end #end of change zip code if

      else
        Recommendation.make_recommendation(user, d)
      end
    end


  def self.return_old_recommendations(user_id)
    array = Recommendation.where(user_id: user_id)
    array = array.select(:dessertplace_id).uniq
    Dessertplace.gets_info_prior_rec(array)
  end
end
