class UsersController < ApplicationController

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    authorize_user(@user)
    erb :'/users/edit'
  end

  patch '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    authorize_user(@user)
    @user.update(name: params[:name], username: params[:username], password: params[:password])
    redirect '/recipes'
  end
end