class AddRolesToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_banned, :boolean, :default => false
    add_column :users, :is_admin, :boolean, :default => false
  end
end
