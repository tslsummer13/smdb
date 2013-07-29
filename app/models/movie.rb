class Movie < ActiveRecord::Base
  def director
    return Director.find_by_id(self.director_id)
  end

  def roles
    # Make this work. It should return an array of all of the roles that belong to this movie.
  end
end
