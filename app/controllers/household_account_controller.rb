class HouseholdAccountController < ApplicationController
  def list
  	@household_account_summary = HouseholdAccountSummary.new
  end
end
