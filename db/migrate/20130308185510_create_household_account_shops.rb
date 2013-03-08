class CreateHouseholdAccountShops < ActiveRecord::Migration
  def change
    create_table :household_account_shops do |t|
      t.string :shop_id
      t.string :shop_text
      t.integer :user_id

      t.timestamps
    end
  end
end
