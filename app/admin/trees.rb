ActiveAdmin.register Tree do
  scope :joined, :default => true do |tree|
    tree.includes [:tree_type]
    tree.includes [:tree_genus]
  end

  controller do
    def max_csv_records; @per_page; end

  end

  index do
    selectable_column
    column :id
    column :tree_type, :sortable => 'tree_types.common_name'
    column :genus, :sortable => 'tree_genus.genus'
    column :species, :sortable => 'tree_types.species'
    column "DBH", :diameter_at_height, :sortable
    column :height
    column :spread
    column :agency
    column :plant_date
    default_actions
  end



  form do |f|
    f.inputs "Basics" do
      f.input :tree_type, :as => :select, :collection => TreeType.order("common_name")
      f.input :agency, :as => :select, :collection => Agency.order("shortname")
   #   f.input :tree_status_id, :as => :select, :collection => TreeStatus.order("level")
      f.input :height
      f.input :spread
      f.input :grove
    end

    f.inputs "Dates" do
      f.input :maint_date
      f.input :plant_date
      f.input :replace_date
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :to_s
      row :agency
      row :diameter_at_height
      row :height
      row :spread
      row :maint_date
      row :plant_date
      row :replace_date
    end
    active_admin_comments
  end

  csv do
    column :id
    column :tree_type
    column ("genus") { |tree| tree.genus }
    column ("species") { |tree| tree.species }
    column :diameter_at_height
    column :height
    column :spread
    column :agency
    column :plant_date
  end

end
