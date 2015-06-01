class AddGoalToProject < ActiveRecord::Migration
  def change
    add_column :projects, :goal, :decimal, :precision => 8, :scale => 2
  end
end
