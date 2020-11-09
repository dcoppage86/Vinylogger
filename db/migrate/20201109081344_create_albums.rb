class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :artist
      t.string :title
      t.datetime :release_date
      t.string :description

      t.timestamps null: false
    end
  end
end
