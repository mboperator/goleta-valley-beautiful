class AddLonlatIndex < ActiveRecord::Migration
  def up
    change_table :trees do |t|
      t.index :lonlat, :spatial => true
    end
  end

  def down
  end
end
