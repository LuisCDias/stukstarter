class AddOrderDataToUserPledge < ActiveRecord::Migration
  def change
  	add_column :user_pledges, :shipping, :decimal, :precision => 8, :scale => 2
  	add_column :user_pledges, :expiration_date, :date
  	add_column :user_pledges, :number, :integer
  	add_column :user_pledges, :uuid, :string  	
  	add_column :user_pledges, :token, :string
  	add_column :user_pledges, :name, :string
  	add_column :user_pledges, :address, :string
  	add_column :user_pledges, :city, :string
  	add_column :user_pledges, :country, :string
  	add_column :user_pledges, :postal_code, :string
  end
end
