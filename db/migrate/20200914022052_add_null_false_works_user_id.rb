class AddNullFalseWorksUserId < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :works, :user_id, false
  end
end
