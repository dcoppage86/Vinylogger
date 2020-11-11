class UsersController < ApplicationController

  get "/users" do
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      erb :"/users/account"
    end
  end

  post "/login" do
    user = User.find_by(:username => params["username"])

    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      flash.next[:greeting] = "Ready To Log Some More Wax, #{user.username}?"
      redirect "/account"
    else
      flash.next[:error] = "Way To Go Cochise, Want To Try That Again?"
      redirect "applications/login"
    end
  end

  get "/signup" do

    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
