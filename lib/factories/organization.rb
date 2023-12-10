# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }

    sequence :description do |index|
      "Description for organization #{index}"
    end
  end
end
