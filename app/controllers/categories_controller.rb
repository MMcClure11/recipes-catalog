class CategoriesController < ApplicationController

  get '/categories' do 
    authenticate
    @user = current_user
    erb :'/categories/index'
  end

  get '/categories/:id' do
    authenticate
    @user = current_user
    @category = Category.find_by(id: params[:id])
    erb :'/categories/show'
  end

end