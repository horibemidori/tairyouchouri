class Public::RecipesController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:new,:show]

  def new
    @recipe = Recipe.new
    
  end

  def index
    @recipes = Recipe.all

  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to recipe_path(@recipe.id)
    else
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
     flash[:notice] = "更新に成功しました。"
     redirect_to recipe_path(@recipe.id)
    else
     flash.now[:notice] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to user_path(current_user.id)
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :recipe, :image, :category1, :category2)
  end

  def is_matching_login_user
    recipe = Recipe.find(params[:id])
    unless recipe.user.id == current_user.id
      redirect_to recipes_path
    end
  end

  def ensure_guest_user
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはレシピを投稿およびレシピ詳細を閲覧できません。"
    end
  end
end
