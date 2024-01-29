# frozen_string_literal: true

class Invitation < ApplicationRecord
  include Decoratable

  # Associations
  belongs_to :wedding, optional: false
  has_many :guests, dependent: :nullify

  # Validations
  validates :guests, length: { minimum: 1 }
  validate :guests_in_wedding_guests_list, if: -> { wedding.present? }

  private

  def guests_in_wedding_guests_list
    uninvited_guests = guests.reject { wedding.in_guests_list?(_1) }

    return if uninvited_guests.empty?

    errors.add(:guests, :guest_not_invited_to_wedding)
    uninvited_guests.each { _1.errors.add(:guests, :guest_not_invited_to_wedding) }
  end
end
