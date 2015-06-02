# == Schema Information
#
# Table name: user_pledges
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  reward_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  amount          :integer
#  shipping        :decimal(8, 2)
#  expiration_date :date
#  number          :integer
#  uuid            :string
#  token           :string
#  name            :string
#  address         :string
#  city            :string
#  country         :string
#  postal_code     :string
#

require 'test_helper'

class UserPledgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
