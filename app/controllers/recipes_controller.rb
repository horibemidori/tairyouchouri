class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all


  end

  def show
    @recipe = Recipe.find(params[:id])
    
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
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :recipe)
  end
end
