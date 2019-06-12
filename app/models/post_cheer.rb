class PostCheer < ApplicationRecord

  belongs_to :user

  # cheerの数をcheer_countカラムに入れる
  belongs_to :post, counter_cache: :cheer_count

end
