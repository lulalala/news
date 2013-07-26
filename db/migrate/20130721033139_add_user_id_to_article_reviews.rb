class AddUserIdToArticleReviews < ActiveRecord::Migration
  def change
    add_column :article_reviews, :user_id, :integer, null:false, default:100
  end
end
