class UsersController < ApplicationController
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
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end
  
  def user_params
    params.require(:user).permit(:name, :nickname)
  end
end
