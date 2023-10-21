# frozen_string_literal: true

class Wedding < ApplicationRecord
  # Associations
  has_many :guests, dependent: :destroy
end
