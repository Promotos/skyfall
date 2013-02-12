class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_list_path, :notice => "User created."
    else
      render "new"
    end
  end

  def show
    load_user_by_id
  end

  def edit
    load_user_by_id
  end

  def update
    load_user_by_id
    if @user.update_attributes(params[:user])
      redirect_to users_list_path, :notice => "User updated"
    else
      render "edit"
    end
  end

  def list

  end

  def change_password
    load_user_by_id
  end

  def change_password_do
    load_user_by_id
    if params[:password].empty? || params[:repeat].empty? 
      flash[:alert] = t("user.password_missing")
      redirect_to :controller => "users", :action => "change_password", :id => params[:id]
      return
    end   
    unless params[:password] == params[:repeat] 
      flash[:alert] = t("user.password_and_repeat_not_equal")
      redirect_to :controller => "users", :action => "change_password", :id => params[:id]
      return
    end   
    @user.change_password(params[:password], params[:repeat])
    redirect_to users_list_path, :notice => t("user.change_password_success")
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_show_path, :notice => "User deleted."
  end

  private

  def load_user_by_id
    if params.has_key?(:id)
      @user = User.find(params[:id])
      redirect_to users_list_path, :alert => "User not found." unless @user
    else
      redirect_to users_list_path, :alert => "Parameter :id is missing."
    end
  end

end

