# == Schema Information
#
# Table name: user_pledges
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  reward_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserPledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward
end
