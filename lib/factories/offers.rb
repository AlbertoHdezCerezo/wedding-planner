# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    association :service
    association :organization

    price_cents { Faker::Number.number(digits: 4) }
  end
end
