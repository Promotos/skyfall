require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should login with success" do
    User.create(user_id: 'admin', password: 'admin', password_confirmation: 'admin')
    post :create, { :user_id => 'admin', :password => 'admin'}
    assert_redirected_to root_url
  end
  
  test "should login with wrong password" do
    User.create(user_id: 'admin', password: 'admin', password_confirmation: 'admin')
    post :create, { :user_id => 'admin', :password => 'wrong'}
    assert_response :success
    assert_equal 'Invalid user or password', flash[:alert]
  end

end
