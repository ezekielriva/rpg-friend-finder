FactoryGirl.define do
  factory :game do
    name      {"Sample Game"}
  end

  trait :with_games do
    games   { FactoryGirl.create_list(:game, 5) }
  end
end
