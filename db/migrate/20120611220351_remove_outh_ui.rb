class RemoveOuthUi < ActiveRecord::Migration
  def up
    remove_column :users, :facebook_oauth_ui
    remove_column :users, :twitter_oauth_ui
  end

  def down
  end
end
