class SessionsController < ApplicationController
  def new
  end

  def create
    logger.warn "Try create skyfall user session for >#{params[:user_id]}<..."
    user = User.authenticate(params[:user_id], params[:password])
    if user
      logger.warn "   for user #{user.user_id}"
      user.last_logon = Time.now
      user.last_logon_ip = request.env['REMOTE_ADDR']
      user.save
      
      logger.warn "Logged in user #{user}"
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      logger.warn "   unknown user -> redirect to login"
      flash.now.alert = "Invalid user or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
