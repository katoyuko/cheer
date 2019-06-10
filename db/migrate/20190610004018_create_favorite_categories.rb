class CreateFavoriteCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_categories do |t|
      t.integer :post_category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
