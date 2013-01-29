require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "simple create user" do
     user = User.create(user_id: 'unit', password: 'test', password_confirmation: 'test')
     assert user.persisted?
   end
   
   test "simple create user and delete" do
     user = User.create(user_id: 'unit', password: 'test', password_confirmation: 'test')
     assert user.persisted?
     
     user.destroy
     assert !user.persisted?
   end
   
   test "simple create user authenticate" do
     user = User.create(user_id: 'unit', password: 'test', password_confirmation: 'test')
     assert user.persisted?
     
     current = User.authenticate('unit', 'test')
     assert user.valid?, 'Check if the user instance is provided by the authenticate method'
   end
end
