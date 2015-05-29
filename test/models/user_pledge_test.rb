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

require 'test_helper'

class UserPledgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
