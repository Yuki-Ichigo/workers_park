class AddColumnWorks < ActiveRecord::Migration[5.2]
  	def up
  		add_column :works, :user_id, :integer
  	end
end
