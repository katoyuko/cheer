class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_many :post_cheers, dependent: :destroy
  has_many :post_cheer_posts, through: :likes, source: :post

  has_many :favorite_categories, dependent: :destroy

  attachment :user_image

end
