FactoryBot.define do
  factory :comment do
    sequence(:comment) { |n| "test_comment#{n}" }
    association :micropost
    user { micropost.user }
  end
end
