# frozen_string_literal: true

class Address < ApplicationRecord
  include Decoratable

  validates :street, :town, :zip_code, :country, presence: true
end
