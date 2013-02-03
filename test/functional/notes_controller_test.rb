require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :redirect
  end

  test "should get create" do
    get :create
    assert_response :redirect
  end

  test "should get show" do
    get :show
    assert_response :redirect
  end

  test "should get edit" do
    get :edit
    assert_response :redirect
  end

  test "should get destroy" do
    get :destroy
    assert_response :redirect
  end

end
