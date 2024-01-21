# frozen_string_literal: true

class AddressParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    required(:country).filled(:string)
    optional(:number).filled(:string)
    optional(:state).filled(:string)
    required(:street).filled(:date)
    required(:town).filled(:string)
    required(:zip_code).filled(:string)
  end
end
