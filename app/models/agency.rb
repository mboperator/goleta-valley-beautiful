class Agency < ActiveRecord::Base
  attr_accessible :description, :name, :shortname

  #Relationships
  has_many :trees

  #Pretty URLs

  #custom JSON
  acts_as_api
  api_accessible :public do |template|
    template.add :name
    template.add :shortname
  end

  def to_s
    "#{shortname} - #{name}"
  end

  def to_label
    "#{shortname} - #{name}"
  end

end
