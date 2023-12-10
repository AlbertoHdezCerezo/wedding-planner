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

    trait :with_offers do
      transient do
        offers_count { 5 }
      end

      offers { build_list(:offer, offers_count) }
    end

    factory :service_with_offers, traits: [:with_offers]
  end
end
