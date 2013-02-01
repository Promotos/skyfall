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
    if params.has_key?(:id)
      @user = User.find(params[:id])
      redirect_to users_list_path, :alert => "User not found." unless @user
    else
      redirect_to users_list_path, :alert => "Parameter :id is missing."
    end
  end

  def edit

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_show_path, :notice => "User deleted."
  end

end

