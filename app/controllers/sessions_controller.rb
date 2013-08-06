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
      flash[:notice] = "Welcome back, #{user.name}."
      redirect_to root_url
    # If not,
    else
      # redirect back to sign-in form
      flash[:error] = "Something went wrong. Please try again."
      render 'new'
    end
  end

  def destroy
    # Forget everything about the user
    reset_session
    # Redirect back to home page
    flash[:notice] = "Signed out successfully."
    redirect_to root_url
  end
end
