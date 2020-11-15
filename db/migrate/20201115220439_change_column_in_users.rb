class ChangeColumnInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :description, :string
    add_column :users, :description, :text
  end
end
