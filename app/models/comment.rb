class Comment < ActiveRecord::Base
  attr_accessible :content

  validates :content, 	:presence => true,
  											:length => { :minimum => 2 }

  belongs_to :post
  belongs_to :user

end
