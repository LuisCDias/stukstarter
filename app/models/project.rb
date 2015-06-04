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
#  status            :string           default("pending")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  goal              :decimal(8, 2)
#  slug              :string
#

class Project < ActiveRecord::Base
  	extend FriendlyId
  	friendly_id :slug_candidates, use: :slugged
	
	belongs_to :user
	has_many :rewards 

	validates :name, :short_description, :description, :image_url, :expiration_date, :goal, presence: true
	#validates :status, inclusion: { in: %w(pending funded expired canceled), message: "%{value} is not a valid status" }

	before_validation :start_project, :on => :create

	def pledges
		rewards.flat_map(&:user_pledges)
	end

	def total_backed_amount
		pledges.map(&:amount).inject(0, :+)
	end

	def funded?
		status == "funded"
	end

	def expired?
		status == "expired"
	end

	def canceled?
		status == "canceled"
	end

	private

	def start_project
		self.expiration_date = 1.month.from_now
		ChargePledgesJob.set(wait_until: self.expiration_date).perform_later self.id
	end

	def slug_candidates
    [
      :name,
      [:name, :created_at]
    ]
  end
end
