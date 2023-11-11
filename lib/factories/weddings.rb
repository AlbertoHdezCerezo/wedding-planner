# frozen_string_literal: true

FactoryBot.define do
  factory :wedding do
    date { Time.zone.today + rand(1..365).days }

    name { "#{Faker::Name.first_name} & #{Faker::Name.first_name}'s" }

    sequence :description do |index|
      "Description for wedding #{index}"
    end

    trait :with_events do
      events { build_list(:event, 3) }
    end
  end
end
