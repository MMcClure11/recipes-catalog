require './config/env'

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
    @recipe = Recipe.create(name: params[:name], 
      serving_size: params[:serving_size], 
      cook_time: params[:cook_time], 
      instructions: params[:instructions], 
      user: current_user)
    
    @recipe.create_recipe_ingredient_from(params[:recipe_ingredients])
    
    @recipe.category_ids = params[:categories]
    if !params[:category][:name].empty?
      @recipe.categories << Category.find_or_create_by(name: params[:category][:name].downcase.capitalize)
    end
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
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
      instructions: params[:instructions])

    @recipe.recipe_ingredients.clear
    @recipe.create_recipe_ingredient_from(params[:recipe_ingredients])

    @recipe.category_ids = params[:recipe][:category_ids]
    if !params[:category][:name].empty?
      @recipe.categories << Category.find_or_create_by(name: params[:category][:name].downcase.capitalize)
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