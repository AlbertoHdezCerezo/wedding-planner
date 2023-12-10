# frozen_string_literal: true

class Organization < ApplicationRecord
  # Associations
  has_many :offers, dependent: :destroy

  # Validations
  validates :name, presence: true
end
