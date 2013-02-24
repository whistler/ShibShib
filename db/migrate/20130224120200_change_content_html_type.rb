class ChangeContentHtmlType < ActiveRecord::Migration
  def change
  	change_column :posts, :content_html, :text
  end
end
