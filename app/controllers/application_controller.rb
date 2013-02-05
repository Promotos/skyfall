class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  before_filter :set_start_time
  before_filter :authenticate

  private
  def set_start_time
    @start_time = Time.now.usec
  end

  def authenticate
    logger.info "Check for authentication #{session}"
    unless("sessions".eql?(controller_name))
      unless logged_in?
        logger.info "Request requires authentication"
        flash[:error] = "You must be logged in to access this section"
        redirect_to log_in_url # halts request cycle
      end
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def logged_in?
    !!current_user
  end
end
