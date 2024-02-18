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

    planned { false }

    start_time { Time.current }
    end_time { rand(10).hours.since(Time.current) }
    schedule { start_time..end_time }

    trait :unplanned do
      planned { false }
    end

    trait :planned do
      planned { true }
    end

    trait :with_place do
      association :place
    end
  end
end
