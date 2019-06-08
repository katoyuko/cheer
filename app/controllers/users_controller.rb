class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.per(8)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
