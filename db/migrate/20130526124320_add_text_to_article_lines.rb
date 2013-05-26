class AddTextToArticleLines < ActiveRecord::Migration
  def change
    add_column :article_lines, :text, :text
  end
end
