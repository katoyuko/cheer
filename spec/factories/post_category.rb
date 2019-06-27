FactoryBot.define do
  factory :post_category do
    sequence(:category) { |n| "category#{n}" }
  end
end