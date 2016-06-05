class TagsTrail < ActiveRecord::Base
  belongs_to :tag
  belongs_to :trail
end
