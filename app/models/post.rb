class Post < ApplicationRecord

  belongs_to :user
  belongs_to :post_category
  has_many :post_comments, dependent: :destroy
  has_many :post_cheers, dependent: :destroy

  attachment :image

  validates :post_content, presence: true

  # メソッド作成 user_idがpost_cheersテーブルに存在していればtrueを返す 投稿にcheerしているか確認
  def post_cheered_by?(user)
    post_cheers.where(user_id: user.id).exists?
  end

end
