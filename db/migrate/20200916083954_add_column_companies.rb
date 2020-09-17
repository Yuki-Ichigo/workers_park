class AddColumnCompanies < ActiveRecord::Migration[5.2]
  def up
    add_column :companies, :introduction, :text
    add_column :companies, :i_image1_id, :string
    add_column :companies, :i_image2_id, :string
    add_column :companies, :future, :text
    add_column :companies, :f_image1_id, :string
    add_column :companies, :f_image2_id, :string
  end
end
