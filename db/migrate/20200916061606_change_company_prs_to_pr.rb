class ChangeCompanyPrsToPr < ActiveRecord::Migration[5.2]
  def change
  	rename_table :company_prs, :about_us
  end
end
