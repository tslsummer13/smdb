class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email => params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Welcome back, #{user.name}."
    else
      flash.now[:error] = "Something went wrong. Please try again."
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Signed out successfully."
  end
end
