class PostCategoriesController < ApplicationController

  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.page(params[:page]).reverse_order.per(20)
  end

private

  def post_category_params
    params.require(:post_category).permit(:category)
  end

end
