class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.integer "company_id", null: false
      t.text "introduction"
      t.text "job_details"
      t.string "image_id"
      t.integer "is_active", default: true, null: false
      t.timestamps
    end
  end
end
