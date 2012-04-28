class AddAuthTokensToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_oauth_ui, :string

    add_column :users, :twitter_oauth_ui, :string
  end
end
