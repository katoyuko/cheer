class Admins::PostCategoriesController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_post_category, only: [:show, :edit, :update, :destroy]

  # 管理者用レイアウトをviewに返す
  layout "admin"

  def show
    @posts = @post_category.posts.page(params[:page]).reverse_order.per(20)
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

  def edit
  end

  def update
    if @post_category.update(post_category_params)
      redirect_to admins_post_categories_path, notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
    if @post_category.destroy
      redirect_to admins_post_categories_path, notice: "削除しました！"
    else
      render :index
    end
  end


private

  def post_category_params
    params.require(:post_category).permit(:category, :category_image)
  end

  def set_post_category
    @post_category = PostCategory.find(params[:id])
  end

end
