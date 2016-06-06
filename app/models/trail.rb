class Trail < ActiveRecord::Base
  validates :name, presence:true
  belongs_to :user

  has_many :tags_trails
  has_many :tags, through: :tags_trails



end
