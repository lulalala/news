class AddReviewsCountToArticleLines < ActiveRecord::Migration
  def up
    add_column :article_lines, :reviews_count, :integer, null:false, default:0
  end
  def down
    remove_column :article_lines, :reviews_count
  end
end
