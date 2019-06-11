class Admins::UsersController < ApplicationController

  # 管理者用レイアウトをviewに返す
  layout "admin"

  def index
    @users = User.page(params[:page]).reverse_order.per(30)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.per(8)
    # お気に入りカテゴリ一覧
    @favorite_categories = @user.favorite_categories.page(params[:page]).reverse_order.per(4)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end

end
