class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user_id, :presence => true, :uniqueness => { :scope => :movie_id, :message => 'has already voted for that movie' }
  validates :movie_id, :presence => true
end
