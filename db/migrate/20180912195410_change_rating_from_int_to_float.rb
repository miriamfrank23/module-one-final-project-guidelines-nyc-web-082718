class ChangeRatingFromIntToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :dessertplaces, :rating, :float
  end
end
