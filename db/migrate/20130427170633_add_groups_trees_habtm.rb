class AddGroupsTreesHabtm < ActiveRecord::Migration
  def up
    create_table :groups_trees do |t|
      t.integer :group_id
      t.integer :tree_id
    end
  end

  def down
    drop_table :groups_trees
  end
end
