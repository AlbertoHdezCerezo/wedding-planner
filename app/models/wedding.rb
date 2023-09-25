# frozen_string_literal: true

class Wedding < ApplicationRecord
  # Associations
  has_many :guests, dependent: :nullify
  has_many :invitations, dependent: :destroy
end
