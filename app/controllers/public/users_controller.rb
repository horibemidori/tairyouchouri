class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def mypage
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
     flash[:notice] = "更新に成功しました。"
     redirect_to user_path(@user.id)
    else
     flash.now[:notice] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

private
  def user_params
    params.require(:user).permit(:name, :nickname)
  end


 def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
 end

end