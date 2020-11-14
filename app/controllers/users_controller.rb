class UsersController < ApplicationController

  get "/users" do
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      erb :"/users/account"
    end
  end

  get '/failure' do
    erb :'/users/failure'
  end

  get '/login' do
    erb :"/users/login"
  end

  post "/login" do
    user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/account"
    else
      redirect "/failure"
    end
  end

  get "/signup" do
    erb :"/users/signup"
  end

  post "/users/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect "/failure"
    else
      User.create(username: params[:username], password: params[:password])
      redirect "/login"
    end
  end

  get '/users/account' do
    redirect "/users/account"
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect :'/users/failure'
    end
  end
end
