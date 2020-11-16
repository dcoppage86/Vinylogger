class AlbumsController < ApplicationController

 
  get "/album/collection" do
    if !logged_in?
      redirect "/login"
    else
      # @user = current_user
      @albums = Album.all#.select { |album| album.user_id == @user.id}
      erb :'/albums/collection'
    end
  end

  # post '/album/collection' do
  #   if !logged_in?
  #     redirect "/login"
  #   else
  #     if (params[:user]

  get "/album/new" do
    if !logged_in?
      redirect "/login"
    else
      @albums = Album.all
      erb :"/albums/collection"
    end
  end

  # # POST: /albums
  # post "/albums" do
  #   redirect "/albums"
  # end

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
