class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
    	t.integer "talk_room_id", null: false
    	t.integer "user_id", null: false
    	t.text "body"
    	t.integer "is_opened", default: false, null: false
        t.timestamps
    end
  end
end
