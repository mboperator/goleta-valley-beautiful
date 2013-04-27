class Tree
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  #Name Fields
  field :common_name, type: String
  field :genus, type: String
  field :species, type: String

  #Location Fields
  field :street_no, type: Integer
  field :street, type: String
  field :city, type: String
  field :state, type: String

  field :loc, :type => Array
  index( { location: "2d" }, { min: -200, max: 200 } )

  #Date Fields, u(pdated)_at and c(reated)_at included.
  field :maint_date, type: Date
  field :replace_date, type: Date
  field :plant_date, type: Date

  #Excel Migration fields, temporary
  field :plant_date_mig, type: String
  field :replace_date_mig, type: String
  field :maint_date_mig, type: String

  #Attribute Fields
  field :ag_id, type: String
  field :diameter_at_height, type: Float
  field :height, type: Float
  field :spread, type: Float
  field :grove, type: Boolean
  field :status, type: Integer

  #Grouping Relation
  belongs_to :group
  belongs_to :agency


  ###Functions
  def migrate_dates
    if plant_date_mig


    elsif replace_date_mig

    elsif maint_date_mig

    end

  end


end
