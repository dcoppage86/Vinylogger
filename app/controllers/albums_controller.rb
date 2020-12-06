class AlbumsController < ApplicationController

 
  get "/albums/collection" do
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      @albums = @user.albums
      erb :'/albums/collection'
    end
  end

  post '/albums/collection' do
    if !logged_in?
      redirect "/login"
    else
      album = current_user.albums.create(title: params[:title], artist: params[:artist], release_date: params[:release_date], description: params[:description])
      redirect "/albums/collection"
    end
  end

  get "/albums/new" do
    if !logged_in?
      redirect "/login"
    else
      erb :"/albums/new"
    end
  end

  
  get "/albums/:id" do
    if logged_in?
      @album = Album.find_by_id(params["id"])
      erb :"/albums/show"
    else
      redirect '/login'
    end
  end

  get "/albums/:id/edit" do
    if @album = Album.find_by_id(params[:id])
      if @album.user.id == current_user.id
        erb :'albums/edit'
      else
        redirect 'users/failure'
      end
    end
    # -----old method to preventing a user from editing another users entry
    # if !logged_in?
    #   redirect '/login'
    # elsif current_user
    #   @album = Album.find_by_id(params[:id])
    #   erb :'albums/edit'
    # else
    #   redirect '/albums/collection'
    # end
  end

  
  patch "/albums/:id" do
    # binding.pry
    if logged_in?
      @user = current_user
      @album = Album.find_by_id(params[:id])
      @album.title = params[:title]
      @album.artist = params[:artist]
      @album.release_date = params[:release_date]
      @album.description = params[:description]
      @album.image = params[:image]
      @album.save
      redirect "/albums/#{@album.id}"
    else
      redirect '/login'
    end
  end


  delete "/albums/:id" do
    if @album = Album.find_by_id(params[:id])
      if @album.user.id == current_user.id
        @album.destroy
      else
        redirect 'users/failure'
      end
    end
    # if @album = 
    # @album = Album.find_by_id(params[:id])
    # @album.destroy
    # redirect "/albums/collection"
  end
end
