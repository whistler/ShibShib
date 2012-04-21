ActiveAdmin.register User do
  scope "Banned Users", :banned
  index do
    column :id
    column :name
    column :email
    column "Banned?", :is_banned
    column "Admin?", :is_admin
    column :last_sign_in_at
    column :last_sign_in_ip
    default_actions
  end
end
