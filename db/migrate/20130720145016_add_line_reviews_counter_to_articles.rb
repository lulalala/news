class AddLineReviewsCounterToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :line_reviews_count, :integer, default:0, null:false
  end
  def down
    remove_column :articles, :line_reviews_count
  end
end
