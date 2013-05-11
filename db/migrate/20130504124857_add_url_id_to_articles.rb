class AddUrlIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :web_domain, :string
    add_column :articles, :url_id, :string
    add_index :articles, [ :web_domain, :url_id ], unique:true
  end
end
