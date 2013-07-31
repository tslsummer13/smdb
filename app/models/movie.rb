class Movie < ActiveRecord::Base
  # belongs to director



  def director
    return Director.find_by_id(self.director_id)
  end

  # has many roles
  def roles
    return Role.where(:movie_id => self.id)
  end
end
