class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title,        null:false
      t.string :reporter_name
      t.text :content,        null:false
      t.datetime :published_at
      t.string :url,          null:false
      t.string :company_name
      t.timestamps
    end
  end
end
