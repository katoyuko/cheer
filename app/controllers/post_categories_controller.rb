class PostCategoriesController < ApplicationController
  def show
    @post_categories = PostCategory.all
  end
end
