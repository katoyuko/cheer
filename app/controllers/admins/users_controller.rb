class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  # 管理者用レイアウトをviewに返す
  layout "admin"

  def index
    # 検索フォームで入力されたキーワードがparamsの中に入る
    @users = User.search(params[:search]).page(params[:page]).reverse_order.per(30)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.per(32)

    # お気に入りカテゴリ
    @favorite_category = FavoriteCategory.new
    @favorite_categories = @user.favorite_categories.page(params[:page]).reverse_order

    # チャート
    @chart_data = {}
    posts = @user.posts.where(created_at: (Time.now.midnight - 1.year)..Time.now.midnight).order(:created_at)
    posts.each do |post|
      date = post.created_at.strftime('%Y/%m')
      if @chart_data.has_key?(date)
        @chart_data[date] += 1
      else
        @chart_data[date] = 1
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path, notice: "削除しました"
  end

end