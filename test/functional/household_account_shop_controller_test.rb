require 'test_helper'

class HouseholdAccountShopControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get shop" do
    get :shop
    assert_response :success
  end

end
