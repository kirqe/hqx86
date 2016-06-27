FactoryGirl.define do
  factory :user do |user|
    user.sequence(:email) {|n| "user#{n}@email.com" }
    password'password'
    password_confirmation 'password'
  end
end
