# frozen_string_literal: true

class Place < ApplicationRecord
  belongs_to :address, dependent: :destroy

  validates :name, presence: true
end
