class AddColumnNullMessageIsOpened < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :messages, :is_opened, false
  end
end
