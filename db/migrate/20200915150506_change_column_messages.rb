class ChangeColumnMessages < ActiveRecord::Migration[5.2]
  def change
   	def down
   		remove_column :messages, :user_id
  		remove_column :messages, :destination_id
  	end
  	def up
  		add_column :messages, :user_id, null:false
  		add_column :messages, :destination_id, null:false
  	end
  end
end
