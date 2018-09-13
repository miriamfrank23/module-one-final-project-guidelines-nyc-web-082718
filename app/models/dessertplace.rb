class Dessertplace < ActiveRecord::Base
  has_many :recommendations
  has_many :users, through: :recommendations



  def self.add_dessertplaces()
    offset = 0
    while offset < 500
      search_result = search("Patisserie", 'New York City', offset)
      # binding.pry
      i = 0
      while i < 50
        name = search_result["businesses"][i]["name"]
        zip_code = search_result["businesses"][i]["location"]["zip_code"]
        rating = search_result["businesses"][i]["rating"]
        price = search_result["businesses"][i]['price']
        display_address = search_result["businesses"][i]["location"]["display_address"][0]
        category = search_result["businesses"][i]["categories"][0]["alias"]
        url = search_result["businesses"][i]['url']
        image_url = search_result["businesses"][i]["image_url"]
        search_result["businesses"][i]["name"]
        # binding.pry
        #big if statement
        puts "#{i}"
        if Dessertplace.exists?(name: name)
          i += 1
        elsif rating >= 4.5 && price != nil
          Dessertplace.create(name: name, zip_code: zip_code, rating: rating, price: price,display_address: display_address, category: category, url: "URL",image_url: image_url)
          i += 1
        else
          i += 1
        end #end of if
      end #end of i < 50 while
    offset += 51
    end #end offset < 500
  end #end of add_dessertplaces


  #clears data from the table
  def self.destroy_database()
    Dessertplace.destroy_all
  end

  def self.gets_info_prior_rec(array_of_prior_recs)
    puts "Your prior recommendations are listed below. We hope you loved them!"
    array_of_prior_recs.each do |rec|
      dest = Dessertplace.where(id: rec.dessertplace_id)
      puts "Name: #{dest[0].name}"
      puts "Address: #{dest[0].display_address}"
      puts ""
    end
  end


end
