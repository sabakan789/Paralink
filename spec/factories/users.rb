FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_name#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { 'password1234' }
    sequence(:password_confirmation) { 'password1234' }
  end
end
