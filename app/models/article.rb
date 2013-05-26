class Article < ActiveRecord::Base
  attr_accessible :title, :reporter_name, :content, :published_at, :url, :company_name
  attr_accessor :reproduced

  has_many :'lines', class_name:'Article::Line'
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
    if @content_lines.nil?
      regular_exp = /(?:    # Either match...
                      「.*」  # a quoted sentence
                    |         # or
                      [^「」『』。？！]*   # anything except quotes or dots.
                    )+        # Repeat as needed
                    [。？！]\s*     # Then match a dot and optionally some whitespace.
                    /x
      @content_lines = content.scan(regular_exp)
      @content_lines.each do |cl| cl.gsub!(/[[:space:]]/, ' ') end
      @content_lines.each(&:strip!)
    end
    @content_lines
  end

  before_create :build_lines
  def build_lines
    content_lines.count.times do |index|
      lines.build(line_number:index+1)
    end
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

