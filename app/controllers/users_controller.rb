class UsersController < ApplicationController

  get '/dashboard' do
    authenticate
    @user = current_user
    erb :'/users/dashboard'
  end

  get '/users/:id/edit' do
    @user = User.find_by(id: params[:id])
    authorize_user(@user)
    erb :'/users/edit'
  end

  patch '/users/:id' do
    @user = User.find_by(id: params[:id])
    authorize_user(@user)
    if !@user.authenticate(params[:password])
      @user.errors.add(:password, "was incorrect")
      erb :'/users/edit'
    else
      if params[:new_password].empty?
        @user.update(name: sanitize(params[:name]), 
          email: sanitize(params[:email]),
          username: sanitize(params[:username])
        )
        if @user.errors.any?
          erb :'/users/edit'
        else
          redirect '/dashboard'
        end
      else
        @user.update(name: sanitize(params[:name]), 
          email: sanitize(params[:email]),
          username: sanitize(params[:username]),
          password: params[:new_password],
          password_confirmation: params[:new_password_confirmation]
          )
          if @user.errors.any?
            erb :'/users/edit'
          else
            redirect '/dashboard'
          end
      end
    end
  end

end