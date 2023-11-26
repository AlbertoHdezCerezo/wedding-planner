# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    association :wedding

    sequence :name do |n|
      "Service Name #{n}"
    end

    sequence :description do |n|
      "Service Description #{n}: Sample of description for a Wedding Service"
    end
  end
end
