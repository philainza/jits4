class CreateOpenMats < ActiveRecord::Migration
  def change
    create_table :open_mats do |t|
      t.string :location
      t.string :host
      t.datetime :starts_at
      t.time :ends_at
      t.string :image_file_name
    end
  end
end
