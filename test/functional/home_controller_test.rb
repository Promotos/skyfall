require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  
  test "should get redirect on request show" do
    @request.session[:user_id] = '100'
    get :show
    assert_response :success
  end

end
