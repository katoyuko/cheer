class PostCategory < ApplicationRecord

  has_many :favorite_categories, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :category, presence: true
  validates :category_image, presence: true

  attachment :category_image
end
