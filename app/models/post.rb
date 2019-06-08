class Post < ApplicationRecord

  belongs_to :user
  belongs_to :post_category

  attachment :image

  validates :post_category_id, presence: true
  validates :post_content, presence: true
             # length: { maximam: 150 }

end
