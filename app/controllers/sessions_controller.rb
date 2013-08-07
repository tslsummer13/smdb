class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email => params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}."
      redirect_to root_url #, :notice => "Welcome back, #{user.name}."
    else
      flash.now[:error] = "Something went wrong. Please try again."
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
