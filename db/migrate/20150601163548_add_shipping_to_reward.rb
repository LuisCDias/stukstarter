class AddShippingToReward < ActiveRecord::Migration
  def change
    add_column :rewards, :shipping, :decimal, :precision => 8, :scale => 2
  end
end
