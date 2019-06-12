class PostCheersController < ApplicationController


  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post_cheer = current_user.post_cheers.new(post_id: post.id)
    post_cheer.save
    # 非同期通信 レスポンスとして投稿した値をrenderを使ってjson形式で返す
    render :json => post.id

    # cheerの合計数を表示
    @post_cheers = PostCheer.where(post_id: params[:post_id])

  end

  def destroy
    post = Post.find(params[:post_id])
    post_cheer = current_user.post_cheers.find_by(post_id: post.id)
    post_cheer.destroy
    # renderを使ってjson形式で返す
    render :json => post.id

    # cheerの合計数を表示
    @post_cheers = PostCheer.where(post_id: params[:post_id])
  end

end
