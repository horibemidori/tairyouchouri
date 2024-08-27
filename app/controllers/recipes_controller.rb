class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.save
    redirect_to recipe_path(recipe.id)
    
  end

  def edit
  end

  def upadate
  end

  def destroy
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :recipe)
  end
end
