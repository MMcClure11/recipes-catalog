require './config/env'
require 'sanitize'

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
    @recipe = Recipe.create(name: sanitize(params[:name]).downcase.capitalize, 
      serving_size: sanitize(params[:serving_size]), 
      cook_time: sanitize(params[:cook_time]), 
      instructions: sanitize(params[:instructions]),
      user: current_user)
    
    @recipe.create_recipe_ingredient_from(params[:recipe_ingredients])
    
    @recipe.category_ids = params[:categories]
    if !params[:category][:name].empty? && !@recipe.categories.include?(Category.find_by(name: sanitize(params[:category][:name]).downcase.capitalize))
      @category = Category.find_or_create_by(name: sanitize(params[:category][:name]).downcase.capitalize)
      if @category.persisted?
        @recipe.categories << @category
      else
        return(erb :'/recipes/new') 
      end
    end
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      erb :'/recipes/new'
    end
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
    
    @recipe.update(name: sanitize(params[:recipe][:name]).downcase.capitalize, 
      serving_size: sanitize(params[:serving_size]), 
      cook_time: sanitize(params[:cook_time]), 
      instructions: sanitize(params[:instructions])
    )

    @recipe.recipe_ingredients.clear
    @recipe.create_recipe_ingredient_from(params[:recipe_ingredients])

    @recipe.category_ids = params[:recipe][:category_ids]
    if !params[:category][:name].empty? && !@recipe.categories.include?(Category.find_by(name: sanitize(params[:category][:name]).downcase.capitalize))
      @category = Category.find_or_create_by(name: sanitize(params[:category][:name]).downcase.capitalize)
      if @category.persisted?
        @recipe.categories << @category
      else
        return(erb :'/recipes/edit') 
      end
    end
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      erb :'/recipes/edit'
    end
  end

  delete '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    authorize(recipe)
    recipe.destroy
    redirect '/recipes'
  end
end