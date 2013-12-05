class AddInvolvedPersonallyToArticleReviews < ActiveRecord::Migration
  def change
    add_column :article_reviews, :involved_personally, :boolean, default:false, null:false
  end
end
