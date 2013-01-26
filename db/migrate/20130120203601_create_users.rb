class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.datetime :last_logon
      t.string   :last_logon_ip      
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
