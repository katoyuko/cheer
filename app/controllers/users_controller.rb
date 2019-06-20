class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.per(12)

    # お気に入りカテゴリ
    @favorite_category = FavoriteCategory.new
    @favorite_categories = @user.favorite_categories.page(params[:page]).reverse_order

    # チャート
    @chart_data = {}
    posts = current_user.posts.all
    posts.each do |post|
      date = post.created_at.strftime('%Y/%m/%d')
      if @chart_data.has_key?(date)
        @chart_data[date] += 1
      else
        @chart_data[date] = 1
      end
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id), notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "退会が完了しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :user_image)
  end
end
