require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  
  test "should get redirect on request show" do
    get :show
    assert_response :redirect
  end

end
