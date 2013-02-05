require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    @request.session[:user_id] = '100'
    get :new
    assert_response :success
  end

end
