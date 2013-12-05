class Suggestion < ActiveRecord::Base
  attr_accessible :content, :email
end

# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

