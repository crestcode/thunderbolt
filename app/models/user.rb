class User < ActiveRecord::Base
  attr_accessible :password_digest, :username, :password, :twitter
  has_secure_password

  validates :username, 	:presence => true

  has_many :posts
  has_many :comments
  has_many :votes

end
