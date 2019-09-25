FactoryBot.define do
  factory :micropost do
    sequence(:content) { |n| "test_content#{n}" }
    association :user
  end
end
