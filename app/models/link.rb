class Link < ActiveRecord::Base
  belongs_to :article
  attr_accessible :description, :url
end
