class ChangeColumnMessages2 < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :messages, :user_id, false
  	change_column_null :messages, :destination_id, false
  end
end
