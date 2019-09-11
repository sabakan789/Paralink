FactoryBot.define do
  factory :topic do
    sequence(:description) { |n| "test_description#{n}" }
    sequence(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/figure_standing.png')) }
    association :micropost
  end
end
