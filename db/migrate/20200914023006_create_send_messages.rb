class CreateSendMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :send_messages do |t|

      t.timestamps
    end
  end
end
