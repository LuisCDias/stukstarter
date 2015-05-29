class AddProjectIdToReward < ActiveRecord::Migration
  def change
    add_reference :rewards, :project, index: true, foreign_key: true
  end
end
