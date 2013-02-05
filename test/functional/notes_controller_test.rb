require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test "should get list" do
    @request.session[:user_id] = '100'
    get :list
    assert_response :success
  end

  test "should get create" do
    @request.session[:user_id] = '100'
    get :create
    assert_response :success
  end

  test "should get show" do
    @request.session[:user_id] = '100'
    get :show
    assert_response :success
  end

  test "should get edit" do
    @request.session[:user_id] = '100'
    get :edit
    assert_response :success
  end

  test "should get destroy" do
    @request.session[:user_id] = '100'
    get :destroy
    assert_response :success
  end

end
