# frozen_string_literal: true

FactoryBot.define do
  factory :dish do
    association :organization

    name { Faker::Food.dish }
    price_cents { Faker::Number.number(digits: 4) }

    trait :with_dietary_restrictions do
      dietary_restrictions { Dish::DIETARY_RESTRICTIONS.sample(3) }
    end

    factory :dish_with_dietary_restrictions, traits: [:with_dietary_restrictions]
  end
end
