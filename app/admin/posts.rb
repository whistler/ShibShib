ActiveAdmin.register Post do
  scope "Reported Posts", :reported
  index do
    column :id
    column :title
    column "Last Update", :updated_at
    default_actions
  end
end
