class UsersController < ApplicationController

  get '/dashboard' do
    authenticate
    @user = current_user
    erb :'/users/dashboard'
  end

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    authorize_user(@user)
    erb :'/users/edit'
  end

  patch '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    authorize_user(@user)
    @user.update(name: params[:name].gsub(/[\<\>\/]/, ""), 
      email: params[:email].gsub(/[\<\>\/]/, ""),
      username: params[:username].gsub(/[\<\>\/]/, ""),
      password: params[:password]
      )
    if @user.save
      redirect '/dashboard'
    else
      erb :"/users/edit"
    end
    
  end

end