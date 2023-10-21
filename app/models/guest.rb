# frozen_string_literal: true

class Guest < ApplicationRecord
  # Associations
  belongs_to :wedding, optional: false
end
