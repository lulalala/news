class Identity < ActiveRecord::Base
  belongs_to :user

  attr_accessible :uid, :provider, :raw

  serialize :raw

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'], raw:auth)
  end
end

# == Schema Information
#
# Table name: identities
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  uid      :string(255)
#  provider :string(255)
#  raw      :text
#

