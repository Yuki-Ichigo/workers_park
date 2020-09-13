class AddIndexCompanysPhoneNumber < ActiveRecord::Migration[5.2]
  def change
  	add_index :companies, :phone_number
  end
end
