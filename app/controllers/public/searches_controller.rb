class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user' 
			@records = User.search_for(@content, @method)
		elsif @model == 'recipe'
			@records = Recipe.search_for(@content, @method)
		elsif @model == 'group'
			@records = Group.search_for(@content, @method)
		end


  end
end
