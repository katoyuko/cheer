class PostCheer < ApplicationRecord

  belongs_to :user

  # cheerの数をcheer_countカラムに入れる(counter_cache:子モデルの数を親モデルのカラムに保存)
  belongs_to :post, counter_cache: :cheer_count

end
