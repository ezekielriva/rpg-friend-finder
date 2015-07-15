require 'test_helper'

class GamesControllerTest < ActionController::TestCase

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create :user
    @user.confirm
  end

  test "should get index" do
    get :index
    assert_response :success
    assert assigns(:games).kind_of?(ActiveRecord::Relation)
  end

  test "should get new" do
    sign_in(:user, @user)
    get :new
    assert_response :success
  end

  test "should get create" do
    sign_in(:user, @user)
    assert_difference("Game.count", 1) do
      post :create, game: { name: "Sample name" }
    end
  end

  test "should get destroy" do
    sign_in(:user, @user)
    game = create(:game)
    assert_difference("Game.count", -1) { delete :destroy, id: game.id }
  end

end
