class DropUserAlbumsTable < ActiveRecord::Migration
  def change
    drop_table :user_albums
  end
end
