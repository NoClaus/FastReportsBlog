# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 3) }
    body { Faker::Lorem.paragraph_by_chars(number: 150) }

    association :user, factory: :user, strategy: :create

    trait :invalid do
      title { nil }
      body  { nil }
    end

    trait :new_attributes do
      title { Faker::Lorem.sentence(word_count: 5) }
      body { Faker::Lorem.paragraph_by_chars(number: 180) }
    end
  end
end
