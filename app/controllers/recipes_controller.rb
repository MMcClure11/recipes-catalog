class RecipesController < ApplicationController

  get '/recipes' do
    authenticate
    @user = current_user
    erb :'/recipes/index'
  end

  get '/recipes/:slug' do
    authenticate
    @recipe = Recipe.find_by_slug(params[:slug])
    erb :'recipes/show'
  end

  end