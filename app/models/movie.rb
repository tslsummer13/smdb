class Movie < ActiveRecord::Base

  has_many :votes, :dependent => :destroy
  has_many :users, :through => :votes

  belongs_to :director
  has_many :roles

  has_many :actors, :through => :roles

  validates :title, :presence => true, :uniqueness => true
  validates :year, :presence => true

end
