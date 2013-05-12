class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.integer :tree_type_id
      t.date :maint_date
      t.date :replace_date
      t.date :plant_date
      t.float :diameter_at_height
      t.float :height
      t.float :spread
      t.boolean :grove
      t.integer :status_id

      t.timestamps
    end
  end
end
