# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    association :wedding

    sequence :name do |n|
      "Event Name #{n}"
    end

    sequence :description do |n|
      "Event Description #{n}: Sample of description for an event"
    end

    schedule { Time.current..rand(10).hours.since(Time.current) }

    trait :unplanned do
      planned { false }
    end

    trait :planned do
      planned { true }
    end
  end
end
