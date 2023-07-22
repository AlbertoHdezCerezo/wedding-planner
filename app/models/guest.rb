# frozen_string_literal: true

class Guest < ApplicationRecord
  # Associations
  belongs_to :wedding, optional: false

  # Enums
  enum state: {
    # Invitation not yet sent
    waiting_for_invitation: 0,
    # Invitation sent, waiting for response
    waiting_for_confirmation: 1,
    # Guest confirmed assistance
    confirmed: 2,
    # Guest declined assistance
    declined: 3,
    # Guest confirmed assistance but then cancelled
    cancelled: 4,
    # Guest was uninvited to wedding
    uninvited: 5
  }
end
