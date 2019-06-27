FactoryBot.define do
  factory :post_comment do
    sequence(:comment) { |n| "comment#{n}" }
  end
end