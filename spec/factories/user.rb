FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "otto-#{n}@gmail.com" }
    password 'theyhaventrealizedimevilyet'
    password_confirmation 'theyhaventrealizedimevilyet'
  end
end
