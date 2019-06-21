class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

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
