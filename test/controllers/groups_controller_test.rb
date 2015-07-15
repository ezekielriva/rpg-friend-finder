require 'test_helper'

class GroupsControllerTest < ActionController::TestCase

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create :user
    @user.confirm
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    sign_in(:user, @user)
    get :new
    assert_response :success
  end

  test "should get edit" do
    sign_in(:user, @user)
    get :edit
    assert_response :success
  end

  test "should get update" do
    sign_in(:user, @user)
    patch :update
    assert_response :success
  end

  test "should get create" do
    sign_in(:user, @user)
    post :create
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get destroy" do
    sign_in(:user, @user)
    delete :destroy
    assert_response :success
  end

end
