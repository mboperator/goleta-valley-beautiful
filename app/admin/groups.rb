ActiveAdmin.register Group do
  controller do
    def trees

    end

    def max_csv_records; @per_page; end

  end


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
