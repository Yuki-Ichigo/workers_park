class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer "user_id", null: false
      t.text "introduction"
      t.text "future"
      t.integer "employment_type", null: false
      t.timestamps
    end
  end
end
