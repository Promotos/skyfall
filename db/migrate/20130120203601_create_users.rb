class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
