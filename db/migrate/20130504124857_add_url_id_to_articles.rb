class AddUrlIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :type, :string
    add_column :articles, :url_id, :string
    add_index :articles, [ :type, :url_id ], unique:true
  end
end
