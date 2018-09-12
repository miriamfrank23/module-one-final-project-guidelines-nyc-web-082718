class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :zip_code
    end
  end
end
