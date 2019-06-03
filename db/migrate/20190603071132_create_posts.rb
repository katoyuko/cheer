class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :post_category_id
      t.text :image_id
      t.text :post_content
      t.integer :user_id

      t.timestamps
    end
  end
end
