class PostCommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id

    if comment.save
      redirect_to post_path(post), notice: "コメントしました！"
    else
      render "posts/show"
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    post_comment = PostComment.find_by(post_id: post.id)
    if post_comment.destroy
      redirect_to post_path(post), notice: "削除しました！"
    else
      render "posts/show"
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :post_id)
  end
end
