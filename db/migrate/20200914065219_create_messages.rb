class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :sender, foreign_key: { to_table: :users }
      t.string "title"
      t.text "body"
      t.integer "is_opened", default: false

      t.timestamps
    end
  end
end
