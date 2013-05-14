class TreeType < ActiveRecord::Base
  attr_accessible :common_name, :tree_genus_id, :species

  belongs_to :tree_genus, :dependent =>:destroy
  has_many :trees
  accepts_nested_attributes_for :tree_genus

  def to_s
    "#{common_name}"
  end

  def genus
    tree_genus
  end

end
