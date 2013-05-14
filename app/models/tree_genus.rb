class TreeGenus < ActiveRecord::Base
  attr_accessible :genus
  has_many :tree_types

  def to_s
    "#{genus}"
  end

  def species_count
    self.tree_types.count
  end
end
