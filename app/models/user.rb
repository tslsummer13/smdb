class User < ActiveRecord::Base
  has_many :votes
  has_many :movies, :through => :votes

  validates :password, :presence => true
  validates :email, :presence => true, :uniqueness => true
end
