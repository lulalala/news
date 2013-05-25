class Article < ActiveRecord::Base
  attr_accessible :title, :reporter_name, :content, :published_at, :url, :company_name
  attr_accessor :reproduced

  has_many :'lines', class_name:'Article::Line'

  validate :reproduced?
  def reproduced?
    if reproduced
      errors.add(:base, "新聞轉載")
    end
  end

  def self.find_existing(domain, url_id)
    Article.where(web_domain:domain,url_id:url_id).first
  end
end

# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  title         :string(255)      not null
#  reporter_name :string(255)
#  content       :text             not null
#  published_at  :datetime
#  url           :string(255)      not null
#  company_name  :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

