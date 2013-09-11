class Movie < ActiveRecord::Base

  scope :new_releases, lambda { where("year > ?", 2010) }
  scope :classics, lambda { where("year < ?", 1960) }
  scope :boring, lambda { where("duration > ?", 90) }
  scope :for_title, lambda { |t| where("title LIKE ?", "%#{t}%") }

  # def self.new_releases
  #   where("year > ?", 2010)
  # end

  # def self.search(term)
  #   where("title LIKE ?", "%#{term}%")
  # end

  has_many :votes, :dependent => :destroy
  has_many :users, :through => :votes
  has_many :reviews

  belongs_to :director
  has_many :roles

  has_many :actors, :through => :roles

  validates :title, :presence => true, :uniqueness => true
  validates :year, :presence => true
end
