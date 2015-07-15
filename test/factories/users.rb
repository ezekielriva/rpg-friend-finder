FactoryGirl.define do
  factory :user do
    sequence(:email)      {|n| "email-#{n}@domain.com"}
    password              :password
    password_confirmation :password
    name                  {"Sample name"}
  end
end
