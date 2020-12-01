class RemoveAlbumIdFromUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :album_id, :integer
  end
end
