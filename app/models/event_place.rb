# frozen_string_literal: true

class EventPlace < ApplicationRecord
  # Associations
  belongs_to :event
  belongs_to :place

  accepts_nested_attributes_for :place, allow_destroy: true

  # Validations
  validates_associated :place
end
