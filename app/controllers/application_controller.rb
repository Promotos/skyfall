class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  before_filter :set_start_time

  private
  def set_start_time
    @start_time = Time.now.usec
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
