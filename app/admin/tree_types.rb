ActiveAdmin.register TreeType do
  scope :joined, :default => true do |tree_types|
    tree_types.includes [:tree_genus]
  end

  index do
    selectable_column
    column :id
    column "Common Name", :sortable => :common_name do |cname|
      link_to cname.common_name, admin_tree_type_path(cname)
    end
    column :tree_genus, :sortable => 'tree_genus.genus'
    column :species
    column :created_at
    column :updated_at
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :common_name
      row :tree_genus
      row :species
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Naming" do
    f.input :tree_genus, :as => :radio, :collection => TreeGenus.all
    f.input :species
    f.input :common_name
    f.actions
    end
  end

end
