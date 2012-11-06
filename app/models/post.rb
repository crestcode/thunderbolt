class Post < ActiveRecord::Base
  attr_accessible :title, :url

  validates :title, 	:presence => true
  validates :url,		:presence => true

  has_many :comments, :dependent => :destroy
end
