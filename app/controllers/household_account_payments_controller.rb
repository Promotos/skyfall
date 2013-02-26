class HouseholdAccountPaymentsController < ApplicationController
  def list
  	@household_account_payments = HouseholdAccountPayment.order(:payment_date).reverse_order.all
  end

  def new
  	@household_account_payment = HouseholdAccountPayment.new
    @household_account_payment.payment_date = DateTime.current
  end

  def create
    logger.warn params[:household_account_payment]
    @household_account_payment = HouseholdAccountPayment.new(params[:household_account_payment])
    @household_account_payment.user_id = @current_user.id
    if @household_account_payment.save
      redirect_to household_account_payments_list_path, :notice => t("common.entry_created")
    else
      render "new"
    end
  end

  def edit
    load_payment_by_id
  end

  def update
    load_payment_by_id
    if @household_account_payment.update_attributes(params[:household_account_payment])
      redirect_to household_account_payments_list_path, :notice => t("common.entry_updated")
    else
      render "edit"
    end
  end

  def show
    load_payment_by_id
  end

  def destroy
    load_payment_by_id
    @household_account_payment.destroy
    redirect_to household_account_payments_list_path, :notice => t("common.entry_deleted")
  end

  private 
  def load_payment_by_id
    if params.has_key?(:id)
      @household_account_payment = HouseholdAccountPayment.find(params[:id])
      redirect_to household_account_payments_list_path, :alert => "Household Account Payment not found." unless @household_account_payment
    else
      redirect_to household_account_payments_list_path, :alert => "Parameter :id is missing."
    end
  end  
end
