# frozen_string_literal: true

class Event < ApplicationRecord
  # Associations
  belongs_to :wedding

  # Validations
  validates :name, presence: true
  validates :planned, inclusion: { in: [true, false] }
  validates :schedule, presence: true

  validates_comparison_of :end_time, greater_than: :start_time

  # Scopes
  scope :chronological, -> { order(schedule: :asc) }

  def start_time = schedule&.begin

  def end_time = schedule&.end
end
