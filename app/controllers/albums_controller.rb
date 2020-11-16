class AlbumsController < ApplicationController

 
  get "/albums" do
    if !logged_in?
      redirect "/login"
    else
      # @user = current_user
      @albums = Album.all#.select { |album| album.user_id == @user.id}
      erb :'/albums/collection'
    end
  end

  post '/albums' do
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      Album.create(title: @album.title, artist: @artist.title, release_date: @album.release_date, description: @album.description)
    end
  end

  get "/album/new" do
    if !logged_in?
      redirect "/login"
    else
      @albums = Album.all
      erb :"/albums/new"
    end
  end

  # # GET: /albums/5
  # get "/albums/:id" do
  #   erb :"/albums/collection"
  # end

  # # GET: /albums/5/edit
  # get "/albums/:id/edit" do
  #   erb :"/albums/edit"
  # end

  # # PATCH: /albums/5
  # patch "/albums/:id" do
  #   redirect "/albums/:id"
  # end

  # # DELETE: /albums/5/delete
  # delete "/albums/:id/delete" do
  #   redirect "/albums"
  # end
end
