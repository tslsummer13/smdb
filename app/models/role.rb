class Role < ActiveRecord::Base
  def movie
    return Movie.find_by_id(self.movie_id)
  end

  def actor
    # Make this work. It should return the actor that this role belongs to.
  end
end
