# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    association :address

    name { Faker::Company.name }
    maps_url { Faker::Internet.url }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
  end
end
