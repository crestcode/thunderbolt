class Vote < ActiveRecord::Base
  attr_accessible :post_id, :direction
end
