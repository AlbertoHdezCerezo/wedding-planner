# frozen_string_literal: true

class Service < ApplicationRecord
  # Associations
  belongs_to :wedding
  has_many :event_services, dependent: :destroy
  has_many :events, through: :event_services

  # Validations
  validates :name, presence: true

  validates_associated :event_services
end
