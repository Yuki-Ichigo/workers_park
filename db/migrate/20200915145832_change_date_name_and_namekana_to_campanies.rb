class ChangeDateNameAndNamekanaToCampanies < ActiveRecord::Migration[5.2]
  def change
  	change_column :companies, :name, :string
  	change_column :companies, :name_kana, :string
  end
end
