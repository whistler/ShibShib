class RemoveOuthUdi < ActiveRecord::Migration
  def up
    remove_column :users, :facebook_oauth_uid
    remove_column :users, :twitter_oauth_uid
  end

  def down
  end
end
