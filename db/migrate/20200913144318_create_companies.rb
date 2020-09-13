class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
    	t.integer "name", null: false
    	t.integer "name_kana", null: false
    	t.string "phone_number", null: false, unique: true
    	t.string "establishment"
    	t.string "url"
    	t.string "email", null: false
    	t.string "zip_code"
    	t.string "address_prefecture", null: false
    	t.string "address_city"
    	t.string "address_line1"
    	t.string "address_line2"
    	t.string "image_id"
    	t.integer "is_active", null: false, default: true
      t.timestamps
    end
  end
end
