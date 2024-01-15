# frozen_string_literal: true

class Address < ApplicationRecord
  validates :addressee, :street, :town, :zip_code, :country, presence: true
end
