require './config/environment'
require './app/models/user'
require './app/models/album'
require './app/models/review'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, '5eb78c1c609a61c9f5408facc88e7138'
  end

  get "/" do
    erb :index
  end

  not_found do
    status 404
    erb :failure
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end



end
