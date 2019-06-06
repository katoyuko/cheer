class PostCategory < ApplicationRecord
  has_many :posts
  validates :post_category, uniqueness: true, presence: true
end
