class RecipesController < ApplicationController

  get '/recipes' do
    authenticate
    @user = current_user
    erb :'/recipes/index'
  end

  get '/recipes/new' do
    authenticate
    @categories = current_user.categories
    erb :'/recipes/new'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    authorize(@recipe)
    erb :'recipes/show'
  end

  post '/recipes' do
    authenticate
    @recipe = Recipe.create(name: params[:name], 
      serving_size: params[:serving_size], 
      cook_time: params[:cook_time], 
      ingredients: params[:ingredients], 
      instructions: params[:instructions], 
      user: current_user)
    @recipe.category_ids = params[:categories]
    if !params[:category][:name].empty?
      new_category = Category.create(params[:category])
      current_user.categories << new_category
      @recipe.categories << new_category
    end
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
    @user = current_user
    authorize(@recipe)
    erb :'/recipes/edit'
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by(id: params[:id])
    authorize(@recipe)
    if !params[:recipe].keys.include?("category_ids")
      params[:recipe]["category_ids"] = []
    end
    @recipe.update(name: params[:recipe][:name], 
      serving_size: params[:serving_size], 
      cook_time: params[:cook_time], 
      ingredients: params[:ingredients], 
      instructions: params[:instructions])
      @recipe.category_ids = params[:recipe][:category_ids]
    if !params[:category][:name].empty?
      new_category = Category.create(params[:category])
      current_user.categories << new_category
      @recipe.categories << new_category
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