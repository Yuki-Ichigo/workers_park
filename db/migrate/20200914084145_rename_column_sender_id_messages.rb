class RenameColumnSenderIdMessages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :messages, :sender_id, :destination_id
  end
end
