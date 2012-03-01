class AddImageToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.has_attached_file :image
    end
  end
end
