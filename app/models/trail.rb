class Trail < ActiveRecord::Base
  validates :name, presence:true
  belongs_to :user

  has_many :tags_trails
  has_many :tags, through: :tags_trails


  # def tag_list
  #   tags
  # end
  #
  # def tag_list=(tags_string)
  #   tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  #   found_tags = tag_names.collect { |name| Tag.find_by(name: name) }
  #   self.tags = found_tags
  # end

end
