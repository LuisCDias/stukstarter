# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  name              :string
#  short_description :string
#  description       :text
#  image_url         :string
#  expiration_date   :date
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  goal              :decimal(8, 2)
#  slug              :string
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
