class AddColumnsRecommendationsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :recommendations, :user_id, :integer
    add_column :recommendations, :dessertplace_id, :integer
  end
end
