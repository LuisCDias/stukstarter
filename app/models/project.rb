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
#

class Project < ActiveRecord::Base
  belongs_to :user

  has_many :rewards 
end
