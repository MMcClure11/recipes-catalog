class RecipesController < ApplicationController

  get '/recipes' do
    authenticate
    @user = current_user
    erb :'/recipes/index'
  end

  get '/recipes/new' do
    authenticate
    erb :'/recipes/new'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    authorize(@recipe)
    erb :'recipes/show'
  end

  post '/recipes' do
    authenticate
    if !params[:categories] && params[:category][:name].empty?
      @error = "Please select a category or create a new category."
      erb :'/recipes/new'
    else
      @recipe = Recipe.create(name: params[:name], 
        serving_size: params[:serving_size], 
        cook_time: params[:cook_time], 
        ingredients: params[:ingredients], 
        instructions: params[:instructions], 
        user: current_user)
      @recipe.category_ids = params[:categories]
      if !params[:category][:name].empty?
        @recipe.categories << Category.create(params[:category])
      end
      @recipe.save
      redirect "/recipes/#{@recipe.id}"
    end
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
    authorize(@recipe)
    erb :'/recipes/edit'
  end

  patch '/recipes/:id' do 
    if !params[:recipe].keys.include?("category_ids")
      params[:recipe]["category_ids"] = []
    end
    @recipe = Recipe.find_by(id: params[:id])
    authorize(@recipe)
    @recipe.update(name: params[:recipe][:name], 
      serving_size: params[:serving_size], 
      cook_time: params[:cook_time], 
      ingredients: params[:ingredients], 
      instructions: params[:instructions])
      @recipe.category_ids = params[:recipe][:category_ids]
    if !params[:category][:name].empty?
      @recipe.categories << Category.create(params[:category])
    end
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    authorize(recipe)
    recipe.destroy
    redirect '/recipes'
  end
end