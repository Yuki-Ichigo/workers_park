class CreateCommunicates < ActiveRecord::Migration[5.2]
  def change
    create_table :communicates do |t|
      t.integer "user_id", null: false
      t.integer "destination_id", null: false
      t.string "title"
      t.text "body"
      t.integer "is_opened", default: 0, null: false
      t.timestamps
    end
  end
end
