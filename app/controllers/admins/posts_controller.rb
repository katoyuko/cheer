class Admins::PostsController < ApplicationController

  before_action :authenticate_admin!

  # 管理者用レイアウトをviewに返す
  layout "admin"

  def top
  end

  def about
  end

  def index
    @posts = Post.all.reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path, notice: "削除しました！"
  end

  private
    def post_params
      params.require(:post).permit(:post_category_id, :image, :post_content, :user_id)
    end

end
