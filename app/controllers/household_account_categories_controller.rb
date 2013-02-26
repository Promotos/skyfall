class HouseholdAccountCategoriesController < ApplicationController
  def list
  	@household_account_categories = HouseholdAccountCategory.all
  end

  def edit
    load_category_by_id
  end

  def update
    load_category_by_id
    if @household_account_category.update_attributes(params[:household_account_category])
      redirect_to household_account_categories_list_path, :notice => t("common.entry_updated")
    else
      render "edit"
    end    
  end

  def new
  	@household_account_category = HouseholdAccountCategory.new
  end

  def create
    @household_account_category = HouseholdAccountCategory.new(params[:household_account_category])
    @household_account_category.user_id = @current_user.id
    if @household_account_category.save
      redirect_to household_account_categories_list_path, :notice => t("common.entry_created")
    else
      render "new"
    end  
  end

  def show
    load_category_by_id
  end

  def destroy
    load_category_by_id
    @household_account_category.destroy
    redirect_to household_account_categories_list_path, :notice => t("common.entry_deleted")
  end

  private 
  def load_category_by_id
    if params.has_key?(:id)
      @household_account_category = HouseholdAccountCategory.find(params[:id])
      redirect_to household_account_categories_list_path, :alert => "Household Account Category not found." unless @household_account_category
    else
      redirect_to household_account_categories_list_path, :alert => "Parameter :id is missing."
    end
  end  
end
