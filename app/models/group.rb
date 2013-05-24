class Group < ActiveRecord::Base
  attr_accessible :description, :name

  #Relationships
  has_and_belongs_to_many :trees

  #custom JSON
  acts_as_api
  api_accessible :public do |template|
    template.add :description
    template.add :name
  end

  def tree_count
    self.trees.count
  end

end
