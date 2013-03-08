class CreateHouseholdAccountPayments < ActiveRecord::Migration
  def change
    create_table :household_account_payments do |t|
      t.integer :user_id
      t.integer :household_account_category_id
      t.integer :household_account_shop_id
      t.string :payment_text
      t.decimal :sum, :precision => 7, :scale => 2
      t.date :payment_date

      t.timestamps
    end
  end
end
