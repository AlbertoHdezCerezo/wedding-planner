# frozen_string_literal: true

FactoryBot.define do
  factory :invitation do
    # For +Invitation+ factory to create invitations with +Guests+ being part
    # of +Wedding+ +Guests+ list we need to previously create both records
    transient do
      sample_guest { create(:guest) }
      sample_wedding { create(:wedding, guests: [sample_guest]) }
    end

    wedding { sample_wedding }
    guests { [sample_guest] }
  end
end
