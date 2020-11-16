require './config/environment'
require './app/models/user'
require './app/models/album'

class ApplicationController < Sinatra::Base

  set :views, proc { File.join(root, '../views/') }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, '5eb78c1c609a61c9f5408facc88e7138'
  end

  get "/" do
    erb :"/applications/home"
  end


  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
    end
    
    def authorized?(album)
      current_user.id == album.user_id
    end
	end



end
