# == Schema Information
#
# Table name: rewards
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :text
#  value              :integer
#  number_available   :integer
#  estimated_delivery :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Reward < ActiveRecord::Base
	has_many :user_pledges
	has_many :backers, through: :user_pledges, source: :user
end
