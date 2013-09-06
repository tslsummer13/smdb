require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "every movie has a year" do
    m = Movie.new(title: "Apollo 13")
    m.valid?
    # assert_equal false, m.valid?
    assert m.errors.messages.has_key?(:year)
  end
end
