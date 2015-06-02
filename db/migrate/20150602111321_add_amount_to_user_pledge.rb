class AddAmountToUserPledge < ActiveRecord::Migration
  def change
    add_column :user_pledges, :amount, :integer
  end
end
