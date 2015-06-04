class ChangeProjectExpirationDateType < ActiveRecord::Migration
	def up
		change_column :projects, :expiration_date, :datetime
	end

	def down
	  	change_column :projects, :expiration_date, :date
	end
end
