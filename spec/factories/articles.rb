# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 3) }
    body { Faker::Lorem.paragraph_by_chars(number: 150) }

    association :user, factory: :user
  end
end
