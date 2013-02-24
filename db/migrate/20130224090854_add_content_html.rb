class AddContentHtml < ActiveRecord::Migration
  def change
  	add_column :posts, :content_html, :string
  end
end
