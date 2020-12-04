class UsersController < ApplicationController

  get '/login' do
    erb :"users/login"
  end

  post "/login" do
    # binding.pry
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect "/users/account"
    else
      redirect "/users/failure"
    end
  end

  get "/signup" do
    erb :"/users/signup"
  end

  post "/signup" do
    # binding.pry
    user = User.new(params)
      if user.save
        session[:user_id] = @user.id
        redirect "/login"
      else
        redirect "/signup"
      end
    # if params[:username] == "" || params[:password] == ""
    #   redirect "/users/failure"
    # elsif !!User.find_by(username: params[:username]) || !!User.find_by(email: params[:email])
    #   redirect "/users/failure"
    # else
    #   User.create(username: params[:username], password: params[:password])
    #   redirect "/login"
    # end
  end

  # post '/account' do
  #   erb :"/users/account"
  # end

  get "/users/account" do
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      erb :"/users/account"
    end
  end



  get '/users/failure' do
    erb :'/users/failure'
  end

  get '/logout' do
    session.clear
    redirect '/'
    # if logged_in?
    #   session.clear
    #   redirect '/'
    # else
    #   redirect :'/users/failure'
    # end
  end
end
