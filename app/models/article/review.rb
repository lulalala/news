class Article::Review < ActiveRecord::Base
  belongs_to :reviewable
  attr_accessible :reviewable_type, :text
end
