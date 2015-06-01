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

class Order < ActiveRecord::Base
  belongs_to :user_pledge

  before_validation :generate_uuid!, :on => :create
  validates_presence_of :name, :price, :user_id
  
  private

  def generate_uuid!
    begin
      self.uuid = SecureRandom.hex(16)
    end while Order.find_by(:uuid => self.uuid).present?
  end
end
