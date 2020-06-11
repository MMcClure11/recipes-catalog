class CategoriesController < ApplicationController

  get '/categories' do 
    authenticate
    @user = current_user
    erb :'/categories/index'
  end

end