class PostCategoriesController < ApplicationController

  def create
    @post_category = PostCategory.new(post_category_params)
    @post_category.save
  end

  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.all
  end

private

  def post_category_params
    params.require(:post_category).permit(:category)
  end

end
