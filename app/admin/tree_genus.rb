ActiveAdmin.register TreeGenus do
  index do |f|
    selectable_column
    column :id
    column "genus", :sortable =>:genus do |genus|
      link_to genus, admin_tree_genu_path(genus)
    end
    column :species_count
    column :updated_at
    default_actions
  end

  show do |s|
    attributes_table do
      row :id
      row :genus
      row :species_count
    end
    active_admin_comments
  end
end

