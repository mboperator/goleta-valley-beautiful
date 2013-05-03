class AddTreeStreets < ActiveRecord::Migration
  def up
    change_table :trees do |t|
      t.integer :street_no
      t.string  :street
    end
  end

  def down
    remove_column :trees, :street_no
    remove_column :trees, :street
  end
end
