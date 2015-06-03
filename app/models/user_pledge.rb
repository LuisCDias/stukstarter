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

class UserPledge < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uuid

  belongs_to :user
  belongs_to :reward

  before_validation :generate_uuid!, :on => :create
  validates_presence_of :name, :address, :city, :country, :postal_code, :amount, :user_id
  
  def charge
    return false unless self.reward.project.funded?
    id = user.customer_id
    if id && @customer = Braintree::Customer.find(id)
      result = Braintree::Transaction.sale(
        :customer_id => @customer.id
        :amount => self.amount
      )
      if result.success?
        # Send email to Customer informing that the shipment is ongoing
      else
        # Send email to Customer informing that the payment has failed
      end
    end
  end

  private

  def generate_uuid!
    begin
      self.uuid = SecureRandom.hex(16)
    end while UserPledge.find_by(:uuid => self.uuid).present?
  end
end
