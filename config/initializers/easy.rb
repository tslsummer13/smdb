# Open up a Rails app that has at least one model
# Create a file named config/initializers/sample.rb
# Paste this code into it
# Open up your console
# Try to figure out how to call these methods
# Try to figure out how they work

class ActiveRecord::Base

  def self.sample
    offset(rand(0...count)).first
  end

  def self.[](id)
    find_by :id => id
  end

end
