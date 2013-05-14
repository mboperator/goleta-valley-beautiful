class CreateTreeStatuses < ActiveRecord::Migration
  def change
    create_table :tree_statuses do |t|
      t.string :status
      t.integer :level

      t.timestamps
    end
  end
end
