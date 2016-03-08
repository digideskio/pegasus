FactoryGirl.define do
  factory :account do |u|
    u.sequence(:username) { |n| "account_#{n}" }
    u.sequence(:email) { |n| "#{n}@example.org" }
    u.password "password"
    u.sequence(:confirmed_at) { Time.zone.now }
  end
end
