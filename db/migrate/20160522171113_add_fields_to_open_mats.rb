class AddFieldsToOpenMats < ActiveRecord::Migration
  def change
    add_column :open_mats, :host, :string
    add_column :open_mats, :street_address, :string
    add_column :open_mats, :city, :string
    add_column :open_mats, :state, :string
    add_column :open_mats, :country, :string
  end
end
