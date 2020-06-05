class SessionsController < ApplicationController

  get '/signup' do
    erb :'/sessions/signup'
  end

  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/recipes'
    else
      erb :'sessions/signup'
    end
  end

  get '/login' do
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