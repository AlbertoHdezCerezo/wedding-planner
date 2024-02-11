# frozen_string_literal: true

FactoryBot.define do
  factory :guest do
    association :wedding

    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    country { Faker::Address.country }
    language { Guest.languages.values.sample }
  end
end
