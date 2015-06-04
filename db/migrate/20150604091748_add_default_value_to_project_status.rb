class AddDefaultValueToProjectStatus < ActiveRecord::Migration
  	def up
		change_column :projects, :status, :string, :default => "pending"
	end

	def down
	  	change_column :projects, :status, :string, :default => nil
	end
end
