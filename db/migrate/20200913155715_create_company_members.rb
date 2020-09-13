class CreateCompanyMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :company_members do |t|
    	t.integer "user_id", null: false
    	t.integer "company_id", null: false
      t.timestamps
    end
  end
end
