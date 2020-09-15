class AddColumnTitleToWorks < ActiveRecord::Migration[5.2]
  def up
  	add_column :works, :title, :string
  end
end
