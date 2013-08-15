class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return User.find_by(:id => session[:user_id])
  end

  helper_method :current_user
  before_filter :authenticate

  def authenticate
    if Rails.env.staging?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["HTTP_USERNAME"] && password == ENV["HTTP_PASSWORD"]
      end
    end
  end

end
