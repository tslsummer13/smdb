class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user_id, :presence => true, :uniqueness => { :scope => :movie_id, :message => 'has already voted for that movie' }
  validates :movie_id, :presence => true

  validate :user_can_only_vote_5_times

  def user_can_only_vote_5_times
    if self.user.votes.count >= 5
      errors.add(:base, "You can't vote anymore.")
    end
  end

end
