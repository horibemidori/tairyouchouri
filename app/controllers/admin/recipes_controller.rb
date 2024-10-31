class Admin::RecipesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def show
    @recipe = Recipe.find(params[:id])
  end
end
