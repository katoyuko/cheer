class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.per(8)

    user = current_user
    @user_posts = user.posts.analytics(:monthly)

    # お気に入りカテゴリ追加
    @favorite_category = FavoriteCategory.new
    # お気に入りカテゴリ一覧
    @favorite_categories = @user.favorite_categories.page(params[:page]).reverse_order.per(4)
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
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :user_image)
  end
end
