class Article::Line < ActiveRecord::Base
  belongs_to :article
  has_many :reviews, :as => :reviewable
  attr_accessible :line_number, :text

  def self.model_name
    ActiveModel::Name.new(self, Article)
  end
end
