FactoryGirl.define do
  factory :user do |user|
    user.sequence(:username) {|n| "#{n}userName" }
    user.sequence(:email) {|n| "user#{n}@email.com" }
    confirmed_at Date.today
    password'password'
    password_confirmation 'password'
  end
end
