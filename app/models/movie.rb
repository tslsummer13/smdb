class Movie < ActiveRecord::Base
  has_many :votes
  has_many :users, :through => :votes

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

  has_many :actors, :through => :roles

  # def actors
  #   my_actors = []

  #   self.roles.each do |role|
  #     my_actors << role.actor
  #   end

  #   return my_actors
  # end
end
