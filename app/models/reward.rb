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

class Reward < ActiveRecord::Base

	belongs_to :project
	has_many :user_pledges
	has_many :backers, through: :user_pledges, source: :user

	validates :name, :description, :value, :estimated_delivery, presence: true
	validates :value, numericality: { greater_than_or_equal_to: 0 }
	validates :number_available, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
	validates :estimated_delivery, date: { after: Date.today }
end
