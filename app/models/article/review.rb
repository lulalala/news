class Article::Review < ActiveRecord::Base
  belongs_to :reviewable, polymorphic:true
  attr_accessible :reviewable_type, :text

  def self.model_name
    ActiveModel::Name.new(self, Article)
  end
end
