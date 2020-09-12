class ChangeIsFlagDefaultOnUsers < ActiveRecord::Migration[5.2]
  def up
  change_column :users, :sex, :integer, default: 0
end

def down
  change_column :users, :sex, :integer
end
end
