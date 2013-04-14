class Article < ActiveRecord::Base
  attr_accessible :title, :reporter_name, :content, :published_at, :url, :company_name
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

