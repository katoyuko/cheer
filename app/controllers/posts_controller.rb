class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def top
    # 投稿数多い順でカテゴリを表示
    # post_categoriesとpostsを内部統合 一週間単位でcount
    post_category_count = PostCategory.joins(:posts).where(created_at: 1.months.ago..Time.now).group(:post_category_id).count
    # 配列をハッシュに変換 要素の順番を並び替え ハッシュのキーを取得
    post_category_ids = Hash[post_category_count.sort_by{ |_, v| -v }].keys
    @post_category_ranks = PostCategory.where(id: post_category_ids).sort_by{|o| post_category_ids.index(o.id)}[0..3]

    # お気に入りカテゴリ一覧
    if @user = current_user
      @favorite_categories = @user.favorite_categories.page(params[:page]).order(created_at: :desc).limit(4)
    end
  end

  def about
  end

  def chart
    @chart_data = {}
    posts = current_user.posts.all
    posts.each do |post|
      date = post.created_at.strftime('%Y/%m/%d')
      if @chart_data.has_key?(date)
        @chart_data[date] += 1
      else
        @chart_data[date] = 1
      end
    end
  end

  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)

    @post_category = PostCategory.find(params[:post_category_id])
    @post.post_category_id = @post_category.id
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render :new
    end
  end


  def index
    @posts = Post.page(params[:page]).reverse_order.per(16)
  end


  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to posts_path, notice: "更新しました！"
    else
      render :edit
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "削除しました！"
  end

  private
    def post_params
      params.require(:post).permit(:post_category_id, :image, :post_content, :user_id)
    end

end

