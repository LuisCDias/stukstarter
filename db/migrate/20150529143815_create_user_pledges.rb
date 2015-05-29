class CreateUserPledges < ActiveRecord::Migration
  def change
    create_table :user_pledges do |t|
      t.references :user, index: true, foreign_key: true
      t.references :reward, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
