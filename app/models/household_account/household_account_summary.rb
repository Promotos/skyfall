class HouseholdAccountSummary

	def get_categories
		HouseholdAccountCategory.all
	end

	def get_month_history
		months = []
		(0..5).each {|m| 
			months << Date.today.ago(m.month).beginning_of_month
		}
		return months
	end

	def get_summary (month, category)
		@payments = HouseholdAccountPayment.where('household_account_category_id = ? AND payment_date BETWEEN ? AND ?', 
			category.id, month.beginning_of_month, month.end_of_month)
		return "" if @payments.empty?
		sum = 0
		@payments.each { |payment|
			sum += payment.sum
		}
		return ('%.2f' % sum).gsub('.', ',')
	end

	def get_summary (month, category)
		payments = HouseholdAccountPayment.where('household_account_category_id = ? AND payment_date BETWEEN ? AND ?', 
			category.id, month.beginning_of_month, month.end_of_month)
		return build_sum(payments)
	end	

	def get_summary_for_month (month)
		payments = HouseholdAccountPayment.where('payment_date BETWEEN ? AND ?', 
			month.beginning_of_month, month.end_of_month)
		return build_sum(payments)
	end

	private
	def build_sum(payments) 
		return "" if payments.empty?
		sum = 0
		payments.each { |payment|
			sum += payment.sum
		}
		return ('%.2f' % sum).gsub('.', ',')
	end

end