class PostCategory < ApplicationRecord

  has_many :favorite_categories, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :post_category, uniqueness: true, presence: true

  attachment :category_image
end
