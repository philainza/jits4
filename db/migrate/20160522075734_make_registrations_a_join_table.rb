class MakeRegistrationsAJoinTable < ActiveRecord::Migration
  def up
    Registration.delete_all
    add_column :registrations, :user_id, :integer
  end

  def down
    Registration.delete_all
    remove_column :registrations, :user_id
  end
end
