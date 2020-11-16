class ChangeColumnInAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :description, :string
    add_column :albums, :description, :text
  end
end
