class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email => params[:email])
    if user.present?
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Welcome back, #{user.name}."
    else
      redirect_to new_session_url, :flash => { :error => "Something went wrong. Please try again." }
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Signed out successfully."
  end
end
