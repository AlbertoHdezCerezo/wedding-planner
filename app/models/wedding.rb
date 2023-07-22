# frozen_string_literal: true

class Wedding < ApplicationRecord
  # Associations
  has_many :invitations, dependent: :destroy
end
