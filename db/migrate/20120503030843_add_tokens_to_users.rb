class AddTokensToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_oauth_uid, :string
    add_column :users, :twitter_oauth_uid, :string
  end
end
