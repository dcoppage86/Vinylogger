require './config/environment'
require './app/models/user'
require './app/models/album'

class ApplicationController < Sinatra::Base

  set :views, proc { File.join(root, '../views/') }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    # binding.pry
    erb :"/applications/home"
  end


  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
	end



end
