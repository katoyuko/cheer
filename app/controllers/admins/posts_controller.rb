class Admins::PostsController < ApplicationController

  before_action :authenticate_admin!, only: [:show, :destroy]

  # 管理者用レイアウトをviewに返す
  layout "admin"

  def top
    # 投稿数多い順でカテゴリを表示
    # post_categoriesとpostsを内部統合 一週間単位でcount
    post_category_count = PostCategory.joins(:posts).where(created_at: 1.months.ago..Time.now).group(:post_category_id).count
    # 配列をハッシュに変換 要素の順番を並び替え ハッシュのキーを取得
    post_category_ids = Hash[post_category_count.sort_by{ |_, v| -v }].keys
    @post_category_ranks = PostCategory.where(id: post_category_ids).sort_by{|o| post_category_ids.index(o.id)}[0..3]

    # お気に入りカテゴリ一覧
    if @user == current_user
      @favorite_categories = @user.favorite_categories.page(params[:page]).order(created_at: :desc).limit(4)
    end

    @post_categories = PostCategory.all
  end

  def about
  end

  def index
    @posts = Post.page(params[:page]).reverse_order.per(16)
  end


  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除しました！"
  end

  private
    def post_params
      params.require(:post).permit(:post_category_id, :image, :post_content, :user_id)
    end

end
