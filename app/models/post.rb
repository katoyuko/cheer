class Post < ApplicationRecord

  belongs_to :user
  belongs_to :post_category

  attachment :image

  validates :title, presence: true
end
