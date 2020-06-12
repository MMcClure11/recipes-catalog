class ApplicationController < Sinatra::Base

  configure do
    set :views, -> {File.join(root, "../views")}
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  # not_found do
  #   'This is nowhere to be found.'
  # end

  # error do
  #   'Sorry there was a nasty error - ' + env['sinatra.error'].message
  # end

  get '/' do
    if logged_in?
      redirect '/recipes'
    else
      erb :index
    end
  end

  helpers do

    def current_user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def authenticate
      redirect '/login' if !logged_in?
    end

    def authorize(resource)
      authenticate
      redirect '/recipes' if resource.user != current_user
    end

    def authorize_user(user)
      authenticate
      redirect '/recipes' if user != current_user
    end

    def sanitize(params)
      Sanitize.fragment(params)
    end

    def render_navbar
      if logged_in?
        erb :logged_in_navbar
      else
        erb :logged_out_navbar
      end
    end

  end

end