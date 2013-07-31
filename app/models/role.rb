class Role < ActiveRecord::Base
  # belongs to movie
  # def movie
  #   return Movie.find_by_id(self.movie_id)
  # end
  belongs_to :movie

  # belongs to actor
  # def actor
  #   return Actor.find_by_id(self.actor_id)
  # end
  belongs_to :role
end
