class Agency
  include Mongoid::Document

  field :_id, type:String, default: -> { shortname }
  field :shortname, type: String
  field :name, type: String
  field :description, type: String

  validates :shortname, uniqueness: true
  has_many :trees

end
