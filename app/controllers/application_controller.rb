class ApplicationController < Sinatra::Base

  configure do
    set :views, -> {File.join(root, "../views")}
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

end