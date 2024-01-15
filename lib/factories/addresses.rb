# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    addressee { Faker::Address.street_address }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    zip_code { Faker::Address.zip_code }
    town { Faker::Address.city }
    country { Faker::Address.country }
    state { Faker::Address.state }
  end
end
