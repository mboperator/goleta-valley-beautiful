class AddTreesGeospatial < ActiveRecord::Migration
  def up
    change_table :trees do |t|
      t.point :lonlat, :srid => 4326
    end
  end

  def down
    remove_column :trees, :lonlat
  end
end
