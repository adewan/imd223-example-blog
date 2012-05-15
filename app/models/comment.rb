class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :user
  belongs_to :post
	
	validates_associated :user, :post
  validates :body, :presence => true
end
