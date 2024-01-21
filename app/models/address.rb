# frozen_string_literal: true

class Address < ApplicationRecord
  validates :street, :town, :zip_code, :country, presence: true
end
