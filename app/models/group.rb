class Group < ActiveRecord::Base
  attr_accessible :description, :name

  #Relationships
  has_and_belongs_to_many :trees

  def tree_count
    self.trees.count
  end

end
