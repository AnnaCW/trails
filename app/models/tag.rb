class Tag < ActiveRecord::Base

  has_many :tags_trails

  has_many :trails, through: :tags_trails

end
