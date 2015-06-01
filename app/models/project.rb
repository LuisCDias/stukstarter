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

	validates :name, :short_description, :description, :image_url, :expiration_date, :status, :goal, presence: true
	validates :status, inclusion: { in: %w(ongoing funded expired), message: "%{value} is not a valid status" }

	before_validation :start_project, :on => :create

	private

	def start_project
		self.status = "ongoing"
		self.expiration_date = 1.month.from_now
	end
end
