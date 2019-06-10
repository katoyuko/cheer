class PostCategoriesController < ApplicationController

  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.all
  end

private

  def post_category_params
    params.require(:post_category).permit(:category)
  end

end
