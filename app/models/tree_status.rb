class TreeStatus < ActiveRecord::Base
  attr_accessible :level, :status

  acts_as_api
  api_accessible :public do |template|
    template.add :level
    template.add :status
  end

  def to_s
    "#{level} - #{status})"
  end

end
