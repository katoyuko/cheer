class FavoriteCategory < ApplicationRecord

  belongs_to :user
  belongs_to :post_category

end
