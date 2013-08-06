class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the user with the email address entered in the sign-in form
    user = User.find_by(:email => params[:email])
    # If there is such a user,
    if user.present?
      # sign them in and
      session[:user_id] = user.id
      # redirect to root url
      redirect_to root_url
    # If not,
    else
      # redirect back to sign-in form
      redirect_to new_session_url
    end
  end

  def destroy
    # Forget everything about the user
    # Redirect back to home page
  end
end
