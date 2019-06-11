class FavoriteCategoriesController < ApplicationController

  def create
    post_category = PostCategory.find(params[:post_category_id])
    favorite_category = current_user.favorite_categories.new(post_category_id: post_category.id)
    favorite_category.save
    redirect_to user_path(current_user), notice: "追加しました！"
  end

  def destroy
    favorite_category = FavoriteCategory.find(params[:id])
    favorite_category.destroy
    redirect_to user_path(current_user), notice: "削除しました！"
  end

  private

  def favorite_category_params
    params.require(:favorite_category).permit(:post_category_id, :user_id)
  end

end
