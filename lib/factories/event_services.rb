# frozen_string_literal: true

FactoryBot.define do
  factory :event_service do
    transient do
      wedding { create(:wedding) }
    end

    event { association :event, wedding: }
    service { association :service, wedding: }
  end
end
