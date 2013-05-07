class AddTreeLatitudeLongitude < ActiveRecord::Migration
  def up
    change_table :trees do |t|
      t.float :longitude
      t.float :latitude
    end
  end

  def down
    remove_column :trees, :longitude
    remove_column :trees, :latitude
  end
end
