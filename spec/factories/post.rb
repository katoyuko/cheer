# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence(:post_content) { |n| "post_content#{n}" }

    trait :no_post_content do
      post_content {}
    end

    trait :too_long_post_content do
      body {Faker::Lorem.characters(141)}
    end
  end
end