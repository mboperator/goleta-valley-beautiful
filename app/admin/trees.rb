ActiveAdmin.register Tree do

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
      row :full_name
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
  
end
