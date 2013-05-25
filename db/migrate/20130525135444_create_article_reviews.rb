class CreateArticleReviews < ActiveRecord::Migration
  def change
    create_table :article_reviews do |t|
      t.references :reviewable
      t.string :reviewable_type, limit:64
      t.text :text

      t.timestamps
    end
    add_index :article_reviews, [ :reviewable_id, :reviewable_type ]
  end
end
