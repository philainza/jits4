class MakeOpenMatsAJoinTable < ActiveRecord::Migration
  def up
    OpenMat.delete_all
    remove_column :open_mats, :host
    remove_column :open_mats, :image_file_name
    add_attachment :open_mats, :asset
    add_column :open_mats, :user_id, :integer
  end

  def down
    OpenMat.delete_all
    remove_column :open_mats, :user_id
    remove_attachment :open_mats, :asset
    add_column :open_mats, :host, :string
    add_column :open_mats, :image_file_name, :string
  end
end
