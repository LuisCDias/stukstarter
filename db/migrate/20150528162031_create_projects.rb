class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :short_description
      t.text :description
      t.string :image_url
      t.date :expiration_date
      t.string :status

      t.timestamps null: false
    end
  end
end
