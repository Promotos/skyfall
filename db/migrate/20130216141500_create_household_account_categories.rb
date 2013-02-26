class CreateHouseholdAccountCategories < ActiveRecord::Migration
  def change
    create_table :household_account_categories do |t|
      t.string :category_id
      t.string :category_text
      t.integer :user_id

      t.timestamps
    end
  end
end
