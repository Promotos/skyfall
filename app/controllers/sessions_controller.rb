class SessionsController < ApplicationController
  def new
  end

  def create
    logger.warn "Create session!!!"
    user = User.authenticate(params[:user_id], params[:password])
    if user
      logger.warn "Logged in!!!"
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid user or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
