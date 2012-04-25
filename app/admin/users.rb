ActiveAdmin.register User do
  scope "Banned Users", :banned
  index do
    column :id
    column :name
    column :email
    column :oauth_provider
    column "Banned?", :is_banned
    column "Admin?", :is_admin
    column :last_sign_in_at
    column :last_sign_in_ip
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :is_banned
      f.input :is_admin
      f.input :oauth_provider
      f.input :oauth_uid
    end
      f.buttons
  end
end
