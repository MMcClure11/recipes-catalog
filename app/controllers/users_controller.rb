class UsersController < ApplicationController

  get '/users/:slug/edit' do
    @user = User.find_by_slug(params[:slug])
    authorize(@user)
    erb :'/users/edit'
  end

end