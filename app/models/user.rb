class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_cheers, dependent: :destroy
  has_many :favorite_categories, dependent: :destroy

  attachment :user_image

  def self.search(search)
    if search
      User.where(['name LIKE ?', "%#{search}%"])
    else
      # 空欄で検索かけたら
      User.all
    end
  end

end
