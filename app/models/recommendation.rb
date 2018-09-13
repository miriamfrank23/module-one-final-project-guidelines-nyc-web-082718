class Recommendation < ActiveRecord::Base
  belongs_to :users
  belongs_to :dessertplaces

  def self.make_recommendation(user, d)
      d = d.sample
      puts "You should go to: #{d.name}"
      puts "Located on: #{d.display_address}"
      puts ""
      Recommendation.create(user_id: user.id, dessertplace_id: d.id)
      repeat_recommendation?(user)
    end


    def self.return_recommendation(user,dessert_type, pricerange)
      d = []
      d = Dessertplace.where(zip_code: user.zip_code, category: dessert_type, price: pricerange)
      if d.length == 0
        puts "no places in this zip meet your criteria"
        puts "#WOULD YOU LIKE TO CHANGE YOUR ZIP"
        puts " or we can give you a random one in nYC Y or N"
        y_n = gets.chomp.downcase
        if y_n == 'y'
          user.change_zip_code
          return_recommendation(user,dessert_type, pricerange)
        elsif y_n == 'n'
          d = Dessertplace.where(category: dessert_type, price: pricerange)
          Recommendation.make_recommendation(user, d)
        else
          puts "ok"
        end #end of change zip code if

      else
        Recommendation.make_recommendation(user, d)
      end
    end


  def self.return_old_recommendations(user_id)
    array = Recommendation.where(user_id: user_id)
    Dessertplace.gets_info_prior_rec(array)
  end
end
