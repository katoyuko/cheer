class PostCategoriesController < ApplicationController

  def create
    @post_category = PostCategory.new(post_category_params)
    @post_category.save
  end

  def show
    @post_categories = PostCategory.all
  end

private

  def post_category_params
    params.require(:post_category).permit(:category)
  end

end
