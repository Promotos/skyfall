class HouseholdAccountShopsController < ApplicationController
  def list
  	@household_account_shops = HouseholdAccountShop.all
  end

  def edit
    load_shop_by_id
  end

  def update
    load_shop_by_id
    if @household_account_shop.update_attributes(params[:household_account_shop])
      redirect_to household_account_shops_list_path, :notice => t("common.entry_updated")
    else
      render "edit"
    end    
  end

  def new
  	@household_account_shop = HouseholdAccountShop.new
  end

  def create
    @household_account_shop = HouseholdAccountShop.new(params[:household_account_shop])
    @household_account_shop.user_id = @current_user.id
    if @household_account_shop.save
      redirect_to household_account_shops_list_path, :notice => t("common.entry_created")
    else
      render "new"
    end  
  end

  def show
    load_shop_by_id
  end

  def destroy
    load_shop_by_id
    @household_account_shop.destroy
    redirect_to household_account_shops_list_path, :notice => t("common.entry_deleted")
  end

  private 
  def load_shop_by_id
    if params.has_key?(:id)
      @household_account_shop = HouseholdAccountShop.find(params[:id])
      redirect_to household_account_shops_list_path, :alert => "Household Account Shop not found." unless @household_account_shop
    else
      redirect_to household_account_shops_list_path, :alert => "Parameter :id is missing."
    end
  end  
end
