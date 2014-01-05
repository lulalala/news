class Article < ActiveRecord::Base
  attr_accessible :title, :reporter_name, :content, :published_at, :url, :company_name
  attr_accessor :reproduced

  has_many :'lines', class_name:'Article::Line'
  has_many :line_reviews, :through => :lines, :source => :reviews
  has_many :reviews, class_name:'Article::Review', :as => :reviewable

  validate :reproduced?
  def reproduced?
    if reproduced
      errors.add(:base, "新聞轉載")
    end
  end

  def self.find_existing(domain, url_id)
    Article.where(web_domain:domain,url_id:url_id).first
  end

  def content_lines
    if ! @content_lines
      @content_lines = [title]
      @content_lines.concat SentenceSplitter.split(content)
    end
    @content_lines
  end

  before_create :build_lines
  def build_lines
    content_lines.each_with_index do |line, index|
      lines.build(text:line, line_number:index+1)
    end
  end
end

# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  reporter_name      :string(255)
#  content            :text             default(""), not null
#  published_at       :datetime
#  url                :string(255)      not null
#  company_name       :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  web_domain         :string(255)
#  url_id             :string(255)
#  line_reviews_count :integer          default(0), not null
#

