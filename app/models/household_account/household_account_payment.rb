class HouseholdAccountPayment < ActiveRecord::Base
  attr_accessible :household_account_category_id, :payment_text, :payment_date, :sum, :user_id

  validates_presence_of :household_account_category_id, :payment_text, :payment_date, :sum, :user_id
  validates_numericality_of :sum

  belongs_to :user
  belongs_to :household_account_category
end
