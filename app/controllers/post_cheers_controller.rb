class PostCheersController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    post_cheer = current_user.post_cheers.new(post_id: post.id)
    post_cheer.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    post_cheer = current_user.post_cheers.find_by(post_id: post.id)
    post_cheer.destroy
    redirect_to post_path(post)
  end

end
