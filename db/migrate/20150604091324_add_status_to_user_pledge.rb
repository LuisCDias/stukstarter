class AddStatusToUserPledge < ActiveRecord::Migration
  def change
    add_column :user_pledges, :status, :string, default: "pending"
  end
end
