class ChangeTypeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :dessertplaces, :type, :category
  end
end
