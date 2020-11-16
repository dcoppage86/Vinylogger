class ChangeColumnInAlbums2 < ActiveRecord::Migration
  def change
    remove_column :albums, :release_date, :datetime
    add_column :albums, :release_date, :integer
  end
end
