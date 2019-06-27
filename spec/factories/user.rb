FactoryBot.define do
  password = Faker::Internet.password

  factory :user do
    sequence(:email) { |n| "example#{n}@test.com" }
    sequence(:name) { |n| "name#{n}" }
    sequence(:introduction) { |n| "introduction#{n}" }
    password { password }
    password_confirmation { password }

    trait :no_name do
      name {}
    end

    trait :too_long_name do
      name {Faker::Lorem.characters(41)}
    end

    trait :too_long_introduction do
      introduction {Faker::Lorem.characters(201)}
    end

    trait :create_with_posts do
      after(:create) do |user|
        create_list(:post, 3, user: user)
      end
    end
  end
end
