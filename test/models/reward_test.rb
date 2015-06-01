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
#  project_id         :integer
#  shipping           :decimal(8, 2)
#

require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
