class PostCheersController < ApplicationController

  before_action :authenticate_user!

  def create
    @post_cheer = PostCheer.create(user_id: current_user.id, post_id: params[:post_id])
    # cheerの合計数を表示
    @post_cheers = PostCheer.where(post_id: params[:post_id])
    # 投稿一覧ページを表示
    @posts = Post.all
  end

  def destroy
    post_cheer = PostCheer.find_by(user_id: current_user.id, post_id: params[:post_id])
    post_cheer.destroy
    @post_cheers = PostCheer.where(post_id: params[:post_id])
    @posts = Post.all
  end

end
