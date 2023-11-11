# frozen_string_literal: true

class Event < ApplicationRecord
  # Associations
  belongs_to :wedding, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :planned, inclusion: { in: [true, false] }
  validates :schedule, presence: true
end
