class Group < ActiveRecord::Base
  attr_accessible :description, :name

  #Relationships
  has_and_belongs_to_many :trees

end
