class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :shortname
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
