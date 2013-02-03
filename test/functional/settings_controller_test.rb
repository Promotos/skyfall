require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :redirect
  end

end
