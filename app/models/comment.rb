class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id

  validates :content, 	:presence => true,
  											:length => { :minimum => 2 }

  belongs_to :post
end
