ActiveAdmin.register Group do

  index do
    selectable_column
    column :id
    column :name
    column :description
    column :tree_count
    column :created_at
    column :updated_at
    default_actions
  end
  
end
