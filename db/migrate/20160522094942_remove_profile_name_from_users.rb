class RemoveProfileNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :profile_name
  end

  def down
    add_column :users, :profile_name, :string
  end

end
