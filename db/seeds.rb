# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

directors_file = Rails.root.join('lib', 'seeds', 'directors.json').to_s
director_hashes = JSON.parse(open(directors_file).read)

Director.destroy_all
director_hashes.each do |director_hash|
  d = Director.new
  d.name = director_hash["name"]
  d.image_url = director_hash["image_url"]
  d.bio = director_hash["bio"]
  d.dob = director_hash["dob"]
  d.save
end
puts "There are now #{Director.count} rows in the directors table."

movies_file = Rails.root.join('lib', 'seeds', 'movies.json').to_s
movie_hashes = JSON.parse(open(movies_file).read)

Movie.destroy_all
movie_hashes.each do |movie_hash|
  m = Movie.new
  m.title = movie_hash["title"]
  m.year = movie_hash["year"]
  m.duration = movie_hash["duration"]
  m.description = movie_hash["description"]
  m.image_url = movie_hash["image_url"]
  d = Director.find_by_name(movie_hash["director"])
  m.director_id = d.id if d.present?
  m.save
end
puts "There are now #{Movie.count} rows in the movies table."
