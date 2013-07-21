class AddUserIdToArticleReviews < ActiveRecord::Migration
  def change
    add_column :article_reviews, :user_id, :integer, null:false
  end
end
