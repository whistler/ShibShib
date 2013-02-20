class CreateEmoticons < ActiveRecord::Migration
  def change
    create_table :emoticons do |t|
      t.string :keycap
      t.string :unicode
      t.string :name

      t.timestamps
    end
  end
end
