class Role < ActiveRecord::Base
  def movie
    return Movie.find_by_id(self.movie_id)
  end
end
