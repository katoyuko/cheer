class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def show
    @posts = @user.posts.page(params[:page]).reverse_order.per(32)

    # お気に入りカテゴリ
    @favorite_category = FavoriteCategory.new
    @favorite_categories = @user.favorite_categories.page(params[:page]).reverse_order

    # チャート
    @chart_data = {}
    # 直近一年分の投稿データを投稿された順に取得
    posts = current_user.posts.where(created_at: (Time.now - 1.year)..Time.now).order(:created_at)
    posts.each do |post|
      date = post.created_at.strftime('%Y/%m')
      if @chart_data.has_key?(date)
        @chart_data[date] += 1
      else
        if
          @chart_data[date] = 1
        end
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path, notice: "退会が完了しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :user_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end
end
