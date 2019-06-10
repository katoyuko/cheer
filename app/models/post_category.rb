class PostCategory < ApplicationRecord

  has_many :favorite_categories
  has_many :posts
  validates :post_category, uniqueness: true, presence: true

  attachment :category_image
end
