require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should get list" do
    @request.session[:user_id] = '100'
    get :list
    assert_response :success
  end

end
