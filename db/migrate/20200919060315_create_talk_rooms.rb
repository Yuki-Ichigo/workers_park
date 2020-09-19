class CreateTalkRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :talk_rooms do |t|
    	t.integer "company_id", null: false
    	t.integer "user_id", null: false
        t.timestamps
        t.index [:company_id, :user_id], unique: true
    end
  end
end
