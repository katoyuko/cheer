class PostsController < ApplicationController

  def top
  end

  def about
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path, notice: "投稿完了！"
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:post_category_id, :image, :post_content, :user_id)
    end

end

