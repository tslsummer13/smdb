class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the user with the email address entered in the sign-in form
    # If there is such a user,
      # sign them in and
      # redirect to root url
    # If not,
      # redirect back to sign-in form
  end

  def destroy
    # Forget everything about the user
    # Redirect back to home page
  end
end
