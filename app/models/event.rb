# frozen_string_literal: true

class Event < ApplicationRecord
  # Associations
  belongs_to :wedding
  belongs_to :place, optional: true
  has_many :event_services, dependent: :destroy
  has_many :services, through: :event_services

  accepts_nested_attributes_for :place, allow_destroy: true

  # Validations
  validates :name, presence: true
  validates :planned, inclusion: { in: [true, false] }
  validates :schedule, presence: true

  validates_comparison_of :end_time, greater_than: :start_time

  validates_associated :services
  validates_associated :place

  # Scopes
  scope :chronological, -> { order(schedule: :asc) }

  def start_time = schedule&.begin

  def end_time = schedule&.end
end
