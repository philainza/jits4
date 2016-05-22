class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :belt_level, :string
    add_column :users, :age, :integer
    add_column :users, :affiliation, :string
  end
end
