# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    association :organization

    sequence :name do |index|
      "#{organization.name} Menu ##{index}"
    end

    sequence :description do |index|
      "Description for menu #{index}"
    end
  end
end
