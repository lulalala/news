class Article::Review < ActiveRecord::Base
  belongs_to :reviewable, polymorphic:true, counter_cache: true
  belongs_to :user
  attr_accessible :reviewable_type, :reviewable_id, :text, :tag_list

  after_commit :update_article_counter

  acts_as_taggable

  auto_html_for :text do
    link :target => "_blank", :rel => "nofollow"
  end

  def self.model_name
    ActiveModel::Name.new(self, Article)
  end

  def update_article_counter
    if reviewable_type == 'Article::Line'
      article = reviewable.article
      count = article.line_reviews.count
      article.update_column(:line_reviews_count, count)
    end
  end
end

# == Schema Information
#
# Table name: article_reviews
#
#  id              :integer          not null, primary key
#  reviewable_id   :integer
#  reviewable_type :string(64)
#  text            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer          not null
#

