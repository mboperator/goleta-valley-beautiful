class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :common_name
      t.string :genus
      t.string :species
      t.date :maint_date
      t.date :replace_date
      t.datetime :plant_date
      t.float :diameter_at_height
      t.float :height
      t.float :spread
      t.boolean :grove
      t.integer :status

      t.timestamps
    end
  end
end
