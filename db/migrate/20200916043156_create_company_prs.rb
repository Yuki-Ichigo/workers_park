class CreateCompanyPrs < ActiveRecord::Migration[5.2]
  def change
    create_table :company_prs do |t|
	    t.integer "company_id", null: false
	    t.text "introduction"
	    t.string "i_image1_id"
	    t.string "i_image2_id"
	    t.text "future"
	    t.string "f_image1_id"
	    t.string "f_image2_id"
      t.timestamps
    end
  end
end
