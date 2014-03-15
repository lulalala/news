class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :description
      t.references :article

      t.timestamps
    end
    add_index :links, :article_id
  end
end
