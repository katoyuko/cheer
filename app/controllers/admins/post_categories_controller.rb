class Admins::PostCategoriesController < ApplicationController

  # 管理者用レイアウトをviewに返す
  layout "admin"

  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.all
  end

  def index
    @post_category = PostCategory.new
    @post_categories = PostCategory.all
  end

  def create
    @post_category = PostCategory.new(post_category_params)
    if @post_category.save
      redirect_to admins_post_categories_path, notice: "登録しました！"
    else
      @post_categories = PostCategory.all
      render :index
    end
  end

  def destroy
  end


private

  def post_category_params
    params.require(:post_category).permit(:category, :category_image_id)
  end

end
