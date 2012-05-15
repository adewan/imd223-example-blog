class Tag < ActiveRecord::Base
  attr_accessible :tagname

  has_and_belongs_to_many :posts

  validates :tagname, :presence => true
end
