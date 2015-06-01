# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_pledge_id  :integer
#  amount          :integer
#  shipping        :decimal(, )
#  expiration_date :date
#  number          :integer
#  uuid            :string
#  token           :string
#  name            :string
#  address         :string
#  city            :string
#  country         :string
#  postal_code     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
