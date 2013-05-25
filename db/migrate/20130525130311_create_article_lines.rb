class CreateArticleLines < ActiveRecord::Migration
  def change
    create_table :article_lines do |t|
      t.references :article
      t.integer :line_number

      t.timestamps
    end
    add_index :article_lines, [:article_id, :line_number]
  end
end
