class AddCategoryImageIdToPostCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :post_categories, :category_image_id, :text
  end
end
