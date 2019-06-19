class ChangeDefaultCheerCount < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :cheer_count, :integer, default: 0
  end
end
