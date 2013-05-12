class CreateTreeGenus < ActiveRecord::Migration
  def change
    create_table :tree_genus do |t|
      t.string :genus

      t.timestamps
    end
  end
end
