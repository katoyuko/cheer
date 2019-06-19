class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment, length: { in: 1..70 }
end
