class User < ActiveRecord::Base
  has_many :votes
  has_many :movies, :through => :votes
end
