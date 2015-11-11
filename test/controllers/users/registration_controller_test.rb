require 'test_helper'

class Users::RegistrationsControllerTest < ActionController::TestCase

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = build :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create a new user with address" do
    assert_difference ->{
      User.where(name: @user.name, email: @user.email, address: @user.address).count
    }, 1 do
      post :create, user: { name:                  @user.name,
                            email:                 @user.email,
                            password:              "123123123",
                            password_confirmation: "123123123",
                            address:               @user.address  }
    end
  end

end
