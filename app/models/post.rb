class Post < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags

  validates :title, :presence => true, 
  					:length => { :minimum => 2 }
  					
  validates :body, :presence => true
  #validates_presence_of :title
end
