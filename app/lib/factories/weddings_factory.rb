# frozen_string_literal: true

FactoryBot.define do
  factory :wedding do
    date { Time.zone.today + rand(1..365).days }
    sequence :description do |index|
      "Description for wedding #{index}"
    end
  end
end
