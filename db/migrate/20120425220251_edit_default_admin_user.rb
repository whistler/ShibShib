class EditDefaultAdminUser < ActiveRecord::Migration
  def change
     @default = AdminUser.where(:email => 'admin@example.com').first()
     @default.update_attributes(:email => 'farhan@ib.aus', :password => 'COE007&MCE007', :password_confirmation => 'COE007&MCE007')
  end

  def down
  end
end
