class Article::Line < ActiveRecord::Base
  belongs_to :article
  attr_accessible :line_number
end
