class ChangeAboutUsToinformation < ActiveRecord::Migration[5.2]
  def change
  	rename_table :about_us, :informations
  end
end
