class Reviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :album_id
      t.string :user_id
    end
  end
end
