class Tree < ActiveRecord::Base
  attr_accessible :common_name,
                  :genus,
                  :species,
                  :diameter_at_height,
                  :height,
                  :spread,
                  :grove,
                  :status,
                  :maint_date,
                  :plant_date,
                  :replace_date,
                  :group_ids,
                  :agency_id,
                  #LEGACY FIELDS
                  :street_no,
                  :street,
                  :lonlat,
                  :longitude,
                  :latitude

  #Relationships
  belongs_to :agency
  has_and_belongs_to_many :groups

  #Geospatial
  self.rgeo_factory_generator = RGeo::Geos.factory_generator(:srid => 4326)
  set_rgeo_factory_for_column(:lonlat, RGeo::Geographic.spherical_factory(:srid => 4326))

    #address -> coords
  geocoded_by :address
  after_initialize :init
    #coords -> address
  reverse_geocoded_by :latitude, :longitude

   #custom JSON
  acts_as_api
  api_accessible :public do |template|
    template.add :common_name
    template.add :genus
    template.add :species
    template.add :agency_id
    template.add :status
    template.add :diameter_at_height
    template.add :height
    template.add :spread
    template.add :longitude
    template.add :latitude
  end





  def self.last_updated
    Tree.order( "updated_at DESC").limit(1)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |tree|
        csv << tree.attributes.values_at(*column_names)
      end
    end
  end

  def self.search(search)
    if search
      where('common_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def address
    "#{street_no.to_s} #{[street, "CA", "USA"].compact.join(', ')}"
  end

  def init
    self.lonlat ||= Tree.rgeo_factory_for_column(:lonlat).point(0, 0)
  end

  #def latitude
  #  self.lonlat.lat
  #end
  #
  #def latitude=(value)
  #  lon = self.lonlat.lon
  #  self.lonlat = Tree.rgeo_factory_for_column(:lonlat).point(lon, value)
  #  self.latitude = value
  #end
  #
  #def longitude
  #  self.lonlat.lon
  #end
  #
  #def longitude=(value)
  #  lat = self.lonlat.lat
  #  self.lonlat = Tree.rgeo_factory_for_column(:lonlat).point(value, lat)
  #  self.longitude = value
  #end

  def synclatlon(val1, val2)
    self.lonlat = Tree.rgeo_factory_for_column(:lonlat).point(val2, val1)
  end


end
