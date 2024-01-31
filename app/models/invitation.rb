# frozen_string_literal: true

class Invitation < ApplicationRecord
  include Decoratable
  include AASM

  # Associations
  belongs_to :wedding, optional: false
  has_many :guests, dependent: :nullify

  # Validations
  validates :guests, length: { minimum: 1 }
  validate :guests_in_wedding_guests_list, if: -> { wedding.present? }

  # State Machine
  aasm column: :state, timestamps: false do
    state :pending, initial: true
    state :sent, :opened, :accepted, :declined, :cancelled

    event :deliver do
      transitions from: :pending, to: :sent
    end

    event :open do
      transitions from: :sent, to: :opened
    end

    event :accept do
      transitions from: :opened, to: :accepted
    end

    event :decline do
      transitions from: :opened, to: :declined
    end

    event :cancel do
      transitions from: :accepted, to: :cancelled
    end
  end

  private

  def guests_in_wedding_guests_list
    uninvited_guests = guests.reject { wedding.in_guests_list?(_1) }

    return if uninvited_guests.empty?

    errors.add(:guests, :guest_not_invited_to_wedding)
    uninvited_guests.each { _1.errors.add(:guests, :guest_not_invited_to_wedding) }
  end
end
