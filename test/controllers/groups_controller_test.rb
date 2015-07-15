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
    group = create(:group)
    get :edit, id: group.id
    assert_response :success
  end

  test "should get update" do
    sign_in(:user, @user)
    group = create(:group)
    patch :update, id: group.id, group: { name: "new Name" }
    group.reload
    assert_equal group.name, "new Name"
    assert_response :redirect
  end

  test "should get create" do
    sign_in(:user, @user)
    assert_difference ->{ @user.groups.count }, 1 do
      post :create, group: { name: "Sample group",
                             encounter_point: "Argentina",
                             description: "Some one" }
    end
  end

  test "should get show" do
    group = create(:group, owner: @user)
    get :show, id: group.id
    assert_response :success
  end

  test "should get destroy" do
    sign_in(:user, @user)
    group = create(:group)
    delete :destroy, id: group.id
    assert_response :redirect
  end

end
