class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :integer
  end
end
