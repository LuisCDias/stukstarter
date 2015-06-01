class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user_pledge, index: true, foreign_key: true
      t.integer :amount
      t.decimal :shipping
      t.date :expiration_date
      t.integer :number
      t.string :uuid
      t.string :token
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
