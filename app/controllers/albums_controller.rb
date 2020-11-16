class AlbumsController < ApplicationController

 
  get "/albums/collection" do
    if !logged_in?
      redirect "/login"
    else
      # @user = current_user
      @albums = Album.all
      erb :'/albums/collection'
    end
  end

  post '/albums/collection' do
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      Album.create(title: params[:title], artist: params[:artist], release_date: params[:release_date], description: params[:description])
      redirect "/albums/collection"
    end
  end

  get "/albums/new" do
    if !logged_in?
      redirect "/login"
    else
      @albums = Album.all
      erb :"/albums/new"
    end
  end

  
  get "/albums/:id" do
    if logged_in?
      @album = Album.find_by_id(params[:id])
      erb :"/albums/show"
    else
      redirect '/login'
    end
  end

  get "/albums/:id/edit" do
    if logged_in?
      @album = Album.find_by_id(params[:id])
      erb :'albums/edit'
    else
      redirect '/login'
    end
  end

  
  patch "/albums/:id" do
    if logged_in?
      @user = current_user
      @album = Album.find_by_id(params[:id])
      @album.title = params[:title]
      @album.artist = params[:artist]
      @album.release_date = params[:release_date]
      @album.description = params[:description]
      @album.image = params[:image]
      @album.save
      redirect '/albums/#{@album.id}'
    else
      redirect '/login'
    end
  end


  delete "/albums/:id" do
    @album = Album.find_by_id(params[:id])
    @album.destroy
    redirect "/albums/collection"
  end
end
