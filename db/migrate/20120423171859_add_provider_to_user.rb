class AddProviderToUser < ActiveRecord::Migration
  def change
    add_column :users, :oauth_provider, :string, :default => "ShibShib"
    add_column :users, :oauth_uid, :integer

  end
end
