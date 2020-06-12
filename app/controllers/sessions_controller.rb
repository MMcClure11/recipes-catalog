class SessionsController < ApplicationController

  get '/signup' do
      redirect '/recipes' if logged_in?
      erb :'/sessions/signup'
  end

  post '/signup' do
    redirect '/recipes' if logged_in?
    @user = User.new(name: sanitize(params[:name]), 
      email: sanitize(params[:email]), 
      username: sanitize(params[:username]), 
      password: sanitize(params[:password])
      )
      # password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/recipes'
    else
      erb :'sessions/signup'
    end
  end

  get '/login' do
    redirect '/recipes' if logged_in?
    erb :'/sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/recipes'
    else
      @error = "Your credentials are incorrect. Please try again"
      erb  :'sessions/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end