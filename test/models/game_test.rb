require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "returns those game not in a group" do
    game  = FactoryGirl.create(:game)
    group = FactoryGirl.create(:group, :with_games)
    games = Game.not_in_group(group)
    assert games.include?(game)
  end

  test "returns those games in a group" do
    group = FactoryGirl.create(:group, :with_games)
    assert Game.in_groups.exists?
  end

  test "returns those game not played by a player" do
    user = FactoryGirl.create(:user, :with_games)
    assert Game.not_played(user).empty?
  end
end
