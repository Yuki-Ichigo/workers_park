class CreateReceiveMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :receive_messages do |t|

      t.timestamps
    end
  end
end
