class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.text :description
      t.integer :value
      t.integer :number_available
      t.date :estimated_delivery

      t.timestamps null: false
    end
  end
end
