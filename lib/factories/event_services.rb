# frozen_string_literal: true

FactoryBot.define do
  factory :event_service do
    association :event, factory: :event
    association :service, factory: :service
  end
end
