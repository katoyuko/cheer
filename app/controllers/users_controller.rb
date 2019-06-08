class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order.per(8)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id), notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :user_image)
  end
end
