class DessertPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :dessertplaces do |t|
      t.string :name
      t.integer :zip_code
      t.integer :rating
      t.string :price
      t.string :display_address
      t.string :type
      t.string :url
      t.string :image_url
    end
  end
end
