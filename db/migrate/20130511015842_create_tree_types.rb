class CreateTreeTypes < ActiveRecord::Migration
  def change
    create_table :tree_types do |t|
      t.string :common_name
      t.string :species
      t.integer :tree_genus_id

      t.timestamps
    end
  end
end
