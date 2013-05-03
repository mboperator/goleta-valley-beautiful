class AddAgencyTreesHm < ActiveRecord::Migration
  def up
    change_table :trees do |t|
      t.integer :agency_id
    end
  end

  def down
    remove_column :trees, :agency_id
  end
end
