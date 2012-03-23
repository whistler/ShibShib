class AddIsInappropriateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_inappropriate, :boolean, :default => false
  end
end
