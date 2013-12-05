class Article::Line < ActiveRecord::Base
  belongs_to :article
  has_many :reviews, :as => :reviewable
  attr_accessible :line_number, :text

  def self.model_name
    ActiveModel::Name.new(self, Article)
  end
end

# == Schema Information
#
# Table name: article_lines
#
#  id            :integer          not null, primary key
#  article_id    :integer
#  line_number   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  text          :text
#  reviews_count :integer          default(0), not null
#

