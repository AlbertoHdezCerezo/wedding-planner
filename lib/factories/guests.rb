# frozen_string_literal: true

FactoryBot.define do
  factory :guest do
    association :wedding

    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    country { Faker::Address.country }
  end
end
