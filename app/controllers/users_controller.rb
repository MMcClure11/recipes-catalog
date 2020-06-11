class UsersController < ApplicationController

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    authorize_user(@user)
    erb :'/users/edit'
  end

  patch '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    authorize_user(@user)
    @user.update(name: sanitize(params[:name]), 
      email: sanitize(params[:email]),
      username: sanitize(params[:username]),
      password: sanitize(params[:password])
      )
    if @user.save
      redirect '/recipes'
    else
      erb :"/users/edit"
    end
    
  end

end