class DropTableFromSchema < ActiveRecord::Migration
  def change
    drop_table :descriptions
  end
end
