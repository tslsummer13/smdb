class Director < ActiveRecord::Base
  def movies
    return Movie.where(:director_id => self.id)
  end
end
