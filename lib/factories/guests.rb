FactoryBot.define do
  factory :guest do
    association :wedding
    state { "waiting_for_invitation" }

    traits_for_enum :state, [:waiting_for_invitation]

    transient do
      timestamp { Time.zone.now }
    end

    trait :waiting_for_confirmation do
      state { :waiting_for_confirmation }
      invited_at { timestamp }
    end

    trait :confirmed do
      state { :confirmed }
      invited_at { timestamp }
      confirmed_at { 1.hour.after(timestamp) }
    end

    trait :declined do
      state { :declined }
      invited_at { timestamp }
      cancelled_at { 1.hour.after(timestamp) }
    end

    trait :cancelled do
      state { :cancelled }
      invited_at { timestamp }
      confirmed_at { 1.hour.after(timestamp) }
      cancelled_at { 2.hour.after(timestamp) }
    end

    trait :uninvited do
      state { :uninvited }
      invited_at { timestamp }
    end

    factory :guest_waiting_for_invitation, traits: %i[waiting_for_invitation]
    factory :invited_guest_without_confirmation, traits: %i[waiting_for_confirmation]
    factory :invited_guest_with_confirmation, traits: %i[confirmed]
    factory :invited_guest_with_declination, traits: %i[declined]
    factory :confirmed_guest_with_cancellation, traits: %i[cancelled]
    factory :uninvited_guest, traits: %i[uninvited]
  end
end
