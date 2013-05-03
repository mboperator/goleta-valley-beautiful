class Agency < ActiveRecord::Base
  attr_accessible :description, :name, :shortname

  #Relationships
  has_many :trees

  #Pretty URLs

end
