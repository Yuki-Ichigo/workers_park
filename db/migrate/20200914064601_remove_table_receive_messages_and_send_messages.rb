class RemoveTableReceiveMessagesAndSendMessages < ActiveRecord::Migration[5.2]
  def change
  	drop_table :receive_messages
  	drop_table :send_messages
  end
end
