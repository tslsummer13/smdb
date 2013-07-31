class Movie < ActiveRecord::Base
  # belongs to director

  # The hand-written way
  # def director
  #   return Director.find_by_id(self.director_id)
  # end

  # The long Rails way
  # belongs_to :director, :class_name => "Director", :foreign_key => "director_id"

  # The short Rails way
  belongs_to :director

  # has many roles
  # def roles
  #   return Role.where(:movie_id => self.id)
  # end
  has_many :roles
end
