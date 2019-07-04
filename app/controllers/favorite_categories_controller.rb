class FavoriteCategoriesController < ApplicationController

  before_action :authenticate_user!

  def create
    @favorite_category = FavoriteCategory.new(params[:id])
    @favorite_category.post_category_id = params[:post_category_id]
    @favorite_category.user_id = current_user.id

    if @favorite_category.save
      redirect_to user_path(current_user), notice: "追加しました！"
    else
      redirect_to user_path(current_user), notice: "カテゴリを選択してください！"
    end
  end

  def destroy
    favorite_category = FavoriteCategory.find(params[:id])
    favorite_category.destroy
    redirect_to user_path(current_user), notice: "削除しました！"
  end

end
