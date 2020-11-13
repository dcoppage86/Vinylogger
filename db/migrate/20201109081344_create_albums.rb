class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :artist
      t.string :genre
      t.datetime :release_date
      

      t.timestamps null: false
    end
  end
end
