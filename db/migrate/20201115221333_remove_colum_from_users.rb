class RemoveColumFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :description, :text
  end
end
